def find_modal_element
  page.find('#new_project_modal', visible: true)
end

Then /^I should see a popup window$/ do
 find_modal_element
 page.find('#new_project_modal').should have_content "Add New TODO List"
end
