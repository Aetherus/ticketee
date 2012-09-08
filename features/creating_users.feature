Feature: Creating Users
  In order to add new users to the system
  As a an admin
  I want to be able to add them at the backend

  Background:
    Given there is the following user:
      | email               | password  | admin   |
      | admin@ticketee.com  | P@ssw0rd  | true    |
    And I am signed in as it
    Given I am on the homepage
    When I follow "Admin"
    And follow "Users"
    And follow "New User"

  Scenario: Creating a new user
    When I fill in "Email" with "user@ticketee.com"
    And fill in "Password" with "P@ssw0rd"
    And I fill in "Password confirmation" with "P@ssw0rd"
    And press "Create User"
    Then I should see "User has been created."

  Scenario: Leaving email blank results in an error
    When I fill in "Email" with ""
    And I fill in "Password" with "P@ssw0rd"
    And I fill in "Password confirmation" with "P@ssw0rd"
    And I press "Create User"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"

  Scenario: Creating an admin
    When I fill in "Email" with "newadmin@ticketee.com"
    And fill in "Password" with "P@ssw0rd"
    And I fill in "Password confirmation" with "P@ssw0rd"
    And check "Is an admin?"
    And press "Create User"
    Then I should see "User has been created."
    And I should see "newadmin@ticketee.com (Admin)"
