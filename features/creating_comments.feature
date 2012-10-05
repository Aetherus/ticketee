@wip
Feature: Creating comments
  In order to update a tickets progress
  As a user
  I want to leave comments

  Background:
    Given there is the following user:
      | email             | password |
      | user@ticketee.com | P@ssw0rd |
    And I am signed in as it
    Given there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" has created a ticket for this project:
      | title                   | description                             |
      | Change a ticket's state | You should be able to create a comment  |
    Given I am on the homepage
    And I follow "Ticketee" within "#projects"

  Scenario: Creating a comment
    When I follow "Change a ticket's state"
    And fill in "Text" with "Added a comment!"
    And press "Create Comment"
    Then I should see "Comment has been created."
    Then I should see "Added a comment!" within "#comments"

  Scenario: Creating an invalid comment
    When I follow "Change a ticket's state"
    And press "Create Comment"
    Then I should see "Comment has not been created."
    And I should see "Text can't be blank"