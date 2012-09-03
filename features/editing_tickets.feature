Feature: Editing tickets
  In order to edit information of tickets for particular projects
  As a user
  I want have an interface to do that

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
        | title             | description                   |
        | Make it shiny!    | Gradients! Starbursts! Oh my! |
    And I am on the homepage
    When I follow "TextMate 2"
    And follow "Make it shiny!"
    When I follow "Edit Ticket"

  Scenario: Updating a ticket
    When I fill in "Title" with "Make it really shiny!"
    And press "Update Ticket"
    Then I should see "Ticket has been updated."
    And I should see "Make it really shiny!" within "#ticket h2"
    But I should not see "Make it shiny!"

  Scenario: Updating a ticket with invalid attributes
    When I fill in "Title" with ""
    And fill in "Description" with ""
    When I press "Update Ticket"
    Then I should see "Ticket has not been updated."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"