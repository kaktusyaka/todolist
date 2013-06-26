Feature: Testing projects

  @selenium
  Scenario: Create project
    Given I exist as a user
    And I sign in with valid data
    When I follow "Add TODO List"
    Then I should see a popup window
    And I fill in "Name" with "Test Project"
    And I press "Save"
    Then I should see "Project was successfully created."
    And I should see "Test Project"
