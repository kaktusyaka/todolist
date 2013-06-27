Feature: Testing tasks

  @selenium
  Scenario: Create task with valid data
    Given I am exist and logged user with project
    And I create new task with valid data
    Then I should see success create task message

  @selenium
  Scenario: Create task with invalid data
    Given I am exist and logged user with project
    And I create new task with invalid data
    Then I should see validation error messages

  @selenium
  Scenario: Create new task after validation error
    Given I am exist and logged user with project
    And I create new task with invalid data
    Then I should see validation error messages
    And I create new task with valid data
    Then I should see success create task message

  @wip
  @selenium
  Scenario: Dragging a task
    Given I exist as a user
    And I have a project "VesselHQ"
    And I have a task with name "first task" for project "VesselHQ"
    And I have a task with name "second task" for project "VesselHQ"
    And I have a task with name "third task" for project "VesselHQ"
    When I sign in with valid data
    Then I should see success sign in message
    When I drag first task to the bottom
    Then task "first task" is at the top of the list
    And priority of "first task" should be 3

