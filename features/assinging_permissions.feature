Feature: Assigning Permissions
  In order to grant permissions to users
  As a an admin
  I want a UI to do it

  Background:
    Given there are the following users:
      | email               | password | admin  |
      | user@ticketee.com   | P@ssw0rd | false  |
      | admin@ticketee.com  | P@ssw0rd | true   |
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title       | description       |
      | How Shiny!  | Eye-blindingly so |
    Given I am signed in as "admin@ticketee.com"
    And I am on the homepage
    When I follow "Admin"
    And follow "Users"
    And follow "user@ticketee.com"
    And follow "Permissions"

  Scenario: Assigning viewing permission
    When I check "View" for "TextMate 2"
    And press "Update"
    And I follow "Sign out"
    And sign in as "user@ticketee.com"
    Then I should see "TextMate 2"

  Scenario: Assigning creating tickets permission
    When I check "Create tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I create the following ticket for the "TextMate 2" project:
      | title   | description |
      | Shiny!  | Make it so! |
    Then I should see "Ticket has been created."

  Scenario: Assigning editing tickets permission
    When I check "Edit tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I update the following ticket for the "TextMate 2" project:
      | title       | new title | new description     |
      | How Shiny!  | So Shiny! | I can't believe it! |
    Then I should see "Ticket has been updated."

  Scenario: Assigning deleting tickets permission
    When I check "Delete tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I delete the "How Shiny!" ticket for the "TextMate 2" project
    Then I should see "Ticket has been deleted."