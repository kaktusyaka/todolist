def find_modal_element
  page.find('#new_project_modal', visible: true)
end

Then /^I should see a popup window$/ do
 find_modal_element
 page.find('#new_project_modal').should have_content "Add New TODO List"
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
