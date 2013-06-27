def create_project(user_id, name)
  @project = FactoryGirl.create(:project, user_id: user_id, name: name)
end

def create_task_for_project(task_name, project_name)
  project = Project.find_by_name(project_name)
  FactoryGirl.create(:task, project_id: project.id, name: task_name)
end

def project_should_has_one_task
  Project.first.tasks.count.should eq(1)
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
  project_should_has_one_task
end

And /^I create new task with invalid data$/ do
  click_button "Add Task"
end

Then /^I should see validation error messages$/ do
  page.find(".task_name").should have_content "can't be blank"
  page.find(".task_deadline").should have_content "can't be blank"
end
