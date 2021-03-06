Feature: Testing projects

  @selenium
  Scenario: Create project with valid data
    Given I am exist and logged user
    And I create new project with valid data
    Then I should see create project success message and project

  @selenium
  Scenario: Create project with invalid data and after that with valid data
    Given I am exist and logged user
    And I create new project with invalid data
    Then I should see validations error
    When I fill in "Name" with "My new super project"
    And I press "Save"
    Then I should see create project success message and project

  @selenium
  Scenario: Delete exist project
    Given I am exist and logged user with project
    And I click on delete project link
    And I should see delete popup window
    And I confirm remove
    Then I should see delete project success message

  @selenium
  Scenario: Update exist project
    Given I am exist and logged user with project
    And I click on edit project link
    And I update project name field
    Then I should see success update project name
