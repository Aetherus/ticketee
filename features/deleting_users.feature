Feature: Deleting Users
  In order to remove users
  As a an admin
  I want to click a button and delete them

  Background:
    Given there are the following users:
      | email               | password  | admin |
      | admin@ticketee.com  | P@ssw0rd  | true  |
      | user@ticketee.com   | P@ssw0rd  | false |
    And I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"


  Scenario: Deleting a user
    When I follow "user@ticketee.com"
    And I follow "Delete User"
    Then I should see "User has been deleted."
    And I should not see "user@ticketee.com"

  Scenario: Users cannot delete themselves
    When I follow "admin@ticketee.com"
    Then I should not see "Delete User" link
