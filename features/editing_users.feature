Feature: Editing Users
  In order to change a user's details
  As a an admin
  I want to be able to modify them at the backend

  Background:
    Given there are the following users:
      | email               | password  | admin |
      | admin@ticketee.com  | P@ssw0rd  | true  |
      | user@ticketee.com   | P@ssw0rd  | false |
    And I am signed in as "admin@ticketee.com"
    And I am on the homepage
    When I follow "Admin"
    And follow "Users"
    And follow "user@ticketee.com (User)"
    And follow "Edit User"

  Scenario: Updating a user's details
    When I fill in "Email" with "newguy@ticketee.com"
    And press "Update User"
    Then "newguy@ticketee.com" should receive an email with subject "Confirmation instructions"
    And I should see "User has been updated."
    And I should see "user@ticketee.com"
    But I should not see "newguy@ticketee.com"
    When "newguy@ticketee.com" confirms this email
    When I refresh the page
    Then I should see "newguy@ticketee.com"
    And I should not see "user@ticketee.com"


  Scenario: Toggling a user's admin ability
    When I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user@ticketee.com (Admin)"

  Scenario: Updating with an invalid email fails
    When I fill in "Email" with "fakefakefake"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"
