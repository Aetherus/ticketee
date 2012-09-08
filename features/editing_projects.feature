Feature: Editing projects
  In order to update projects information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there is the following user:
      | email               | password  | admin   |
      | admin@ticketee.com  | P@ssw0rd  | true    |
    And I am signed in as it
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    And follow "Edit Project"

  Scenario: Updating a project
    When I fill in "Name" with "TextMate 2 beta"
    And press "Update Project"
    Then I should be on the project page for "TextMate 2 beta"
    And I should see "Project has been updated."

  Scenario: Updating a project with blank name
    When I fill in "Name" with ""
    And press "Update Project"
    And I should see "Project has not been updated."
    And I should see "Name can't be blank"