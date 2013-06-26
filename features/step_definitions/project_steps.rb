def find_modal_element id
  page.find(id, visible: true)
end

Then /^I should see a popup window$/ do
  find_modal_element "#new_project_modal"
  page.find('#new_project_modal').should have_content "Add New TODO List"
end

And /^I should see delete popup window$/ do
  find_modal_element "#confirmation_dialog"
  page.find('#confirmation_dialog').should have_content "Are you sure?"
end

And /^I create new project with valid data$/ do
  click_link("Add TODO List")
  step %{I should see a popup window}
  fill_in "Name", with: "My new super project"
  click_button "Save"
end

Then /^I should see create project success message and project$/ do
  page.should have_content "Project was successfully created."
  page.should have_content "My new super project"
end

And /^I create new project with invalid data$/ do
  click_link("Add TODO List")
  step %{I should see a popup window}
  click_button "Save"
end

Then /^I should see validations error$/ do
  page.should have_content "can't be blank"
end

Given /^I am exist and logged user with project$/ do
  step %{I am exist and logged user}
  step %{I create new project with valid data}
end

And /^I click on delete project link$/ do
  page.find("#delete_project_1").click
end

Then /^I should see delete project success message$/ do
  page.should have_content "Project was successfully destroyed."
  page.should_not have_content "My new super project"
end
