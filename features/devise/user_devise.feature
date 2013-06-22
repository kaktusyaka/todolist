Feature: Devise User
  Testing user devise full process

  Scenario: sign up with valid data
    Given I sign up with valid data
    Then I should see success sign up message
