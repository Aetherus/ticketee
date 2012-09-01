Feature: Creating tickets
  In order to create tickets for particular projects
  As a user
  I want have an interface to do that

  Background:
    Given there is a project called "Internet Explorer"
    And I am on the homepage
    When I follow "Internet Explorer"
    And follow "New Ticket"

  Scenario: Creating a ticket
    When I fill in "Title" with "Non-standards compliance"
    And fill in "Description" with "My pages are ugly!"
    And press "Create Ticket"
    Then I should see "Ticket has been created."

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