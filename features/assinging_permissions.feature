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