Feature: Creating projects
  In order to have projects to assign tickets to
  As a user
  I want to create them easily

  Background:
    Given there is the following user:
      | email             | password  |  admin   |
      | user@ticketee.com | P@ssw0rd  |  true    |
    And I am signed in as it
    Given I am on the homepage
    When I follow "New Project"

  Scenario: Creating a project
    When I fill in "Name" with "TextMate 2"
    And press "Create Project"
    Then I should see "Project has been created."
    And I should be on the project page for "TextMate 2"
    And I should see "TextMate 2 - Projects - Ticketee"

  Scenario: Creating a project without name
    And press "Create Project"
    Then I should see "Project has not been created."
    And I should see "Name can't be blank"
