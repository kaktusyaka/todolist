def build_user
  @new_user = FactoryGirl.build(:user)
end

def sing_up_user
  build_user
  fill_in "Email", with: @new_user.email
  fill_in "Password", with: "testing1"
  fill_in "Password confirmation", with: "testing1"
  click_button "Sign up"
end

def visit_new_user_page
  visit '/users/sign_up'
end

Given /^I sign up with valid data$/ do
  visit_new_user_page
  sing_up_user
end

Then /^I should see success sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end
