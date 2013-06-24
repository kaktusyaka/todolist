Feature: Testing tasks

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
