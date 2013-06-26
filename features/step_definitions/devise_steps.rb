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

def sing_up_invalid_user
  fill_in "Email", with: ""
  fill_in "Password", with: ""
  fill_in "Password confirmation", with: ""
  click_button "Sign up"
end

def sing_in_user
  fill_in "Email", with: @new_user.email
  fill_in "Password", with: "testing1"
  click_button "Sign in"
end

def sing_in_invalid_user
  fill_in "Email", with: ""
  fill_in "Password", with: ""
  click_button "Sign in"
end

def visit_new_user_page
  visit '/users/sign_up'
end

def visit_sign_in_page
  visit '/users/sign_in'
end

Given /^I sign up with valid data$/ do
  visit_new_user_page
  sing_up_user
end

Given /^I sign up with invalid data$/ do
  visit_new_user_page
  sing_up_invalid_user
end

Given /^I exist as a user$/ do
  build_user
  @new_user.save
end

Then /^I sign in with valid data$/ do
  visit_sign_in_page
  sing_in_user
end

Then /^I sign in with invalid data$/ do
  visit_sign_in_page
  sing_in_invalid_user
end

Then /^I should see success sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see invalid sign up message$/ do
  page.should have_content "can't be blank"
end

Then /^I should see success sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see invalid sign in message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I sign out$/ do
  click_link("Sign out")
end

Then /^I should see success sign out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I fill in form for reset my password$/ do
  visit_sign_in_page
  click_link("Forgot your password?")
  fill_in "Email", with: @new_user.email
  click_button("Send me reset password instructions")
end

Then /^I should receive reset password email$/ do
  step %{"#{@new_user.email}" should receive an email}
  page.should have_content "You will receive an email with instructions about how to reset your password in a few minutes."
  step %{I open the email with subject "Reset password instructions"}
end

Then /^follow instructions for reset password$/ do
  step %{I follow "Change my password" in the email}
  fill_in "Password", with: "testing1"
  fill_in "Password confirmation", with: "testing1"
  click_button("Change my password")
end

Then /^I should see successfully reset password message$/ do
  page.should have_content "Your password was changed successfully. You are now signed in."
end

Given /^I am exist and logged user$/ do
  step %{I exist as a user}
  step %{I sign in with valid data}
end
