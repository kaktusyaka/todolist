Feature: Devise User
  Testing user devise full process

  Scenario: sign up with valid data
    Given I sign up with valid data
    Then I should see success sign up message

  Scenario: sign up with invalid data
    Given I sign up with invalid data
    Then I should see invalid sign up message

  Scenario: sign in with valid data and sign out
    Given I exist as a user
    When I sign in with valid data
    Then I should see success sign in message
    Then I sign out
    And I should see success sign out message

  Scenario: sign in with invalid data
    Given I exist as a user
    When I sign in with invalid data
    Then I should see invalid sign in message

  Scenario: user should receive email and successfully change password
    Given I exist as a user
    When I fill in form for reset my password
    Then I should receive reset password email
    And follow instructions for reset password
    And I should see successfully reset password message
