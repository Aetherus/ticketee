Feature: Creating tickets
  In order to create tickets for particular projects
  As a user
  I want have an interface to do that

  Background:
    Given there is a project called "Internet Explorer"
    And there is a following user:
      | email             | password  |
      | user@ticketee.com | P@ssw0rd  |
    And I am on the homepage
    When I follow "Internet Explorer"
    And follow "New Ticket"
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in "Email" with "user@ticketee.com"
    And fill in "Password" with "P@ssw0rd"
    And press "Sign in"
    Then I should see "New Ticket"

  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"
    And fill in "Description" with "My pages are ugly!"
    And press "Create Ticket"
    Then I should see "Ticket has been created."
    And I should see "Created by user@ticketee.com"

  Scenario: Creating a ticket with invalid attributes
    When I press "Create Ticket"
    Then I should see "Ticket has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"

  Scenario: Description should not be shorter than 10 characters
    When I fill in "Title" with "Non-standards compliance"
    And fill in "Description" with "it sucks."
    And press "Create Ticket"
    Then I should see "Ticket has not been created."
    And I should see "Description is too short"