def create_project(user_id, name)
  @project = FactoryGirl.create(:project, user_id: user_id, name: name)
end

def create_task_for_project(task_name, project_name)
  project = Project.find_by_name(project_name)
  FactoryGirl.create(:task, project_id: project.id, name: task_name)
end

def project_should_has_task count
  Project.first.tasks.count.should eq(count)
end

def task_should_has_name name
  Project.first.tasks.first.name.should eq(name)
end

Given /^I authenticate as a user$/ do
  step %{I exist as a user}
  step %{I sign in with valid data}
  step %{I should see success sign in message}
end

Then /^I have a project "(.*)"$/ do |name|
  create_project(@new_user.id, name)
end

Then /^I have a task with name "(.*)" for project "(.*)"$/ do |task_name, project_name|
  create_task_for_project(task_name, project_name)
end

When /^I drag first task to the bottom$/ do
  page.execute_script "$('.tasks-list:first tr:first').simulateDragSortable({ move: 2, handle: '.handle'})"
  sleep 1
end

Then /^task "(.*)" is at the top of the list$/ do |task_name|
  page.all('.tasks-list tr').last.should have_content(task_name)
end

Then /^priority of "(.*)" should be (\d+)$/ do |task_name, priority|
  Task.find_by_name(task_name).priority.should eq(priority.to_i)
end

And /^I create new task with valid data$/ do
  fill_in "task_name", with: 'New Task'
  fill_in "task[deadline]", with: Date.today.strftime("%Y-%m-%d")
  click_button "Add Task"
end

Then /^I should see success create task message$/ do
  page.should have_content "New Task"
  page.should have_content Date.today.strftime("%Y-%m-%d")
  page.should have_content "Task was successfully created."
  project_should_has_task 1
end

And /^I create new task with invalid data$/ do
  click_button "Add Task"
end

Then /^I should see validation error messages$/ do
  page.find(".task_name").should have_content "can't be blank"
  page.find(".task_deadline").should have_content "can't be blank"
end

Given /^I am exist and logged user with task$/ do
  step %{I am exist and logged user with project}
  step %{I create new task with valid data}
end

And /^I click task link$/ do
  page.find("#delete_task_1").click
  step %{I should see delete popup window}
  step %{I confirm remove}
end

Then /^I should see success remove task message$/ do
  page.should have_content "Task was successfully destroyed."
  project_should_has_task 0
end

And /^I update task$/ do
  page.find("#edit_task_1").click
  step %{I should see edit task popup window}
  find("#edit-task #task_name").set "Updated task name"
  find("#edit-task #datepicker_task_1").set "#{(Date.today + 10.days).strftime("%Y-%m-%d")}"
  click_button "Update"
end

Then /^I should see edit task popup window$/ do
  find_modal_element "#edit-task"
end

Then /^I should see success update task message$/ do
  page.should have_content "Updated task name"
  page.should have_content (Date.today + 10.days).strftime("%Y-%m-%d")
  page.should have_content "Task was successfully updated."
  task_should_has_name "Updated task name"
end
