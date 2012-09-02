Feature: Deleting tickets
  In order to delete a tickets for particular projects
  As a user
  I want a button to make them disappear

  Scenario: Deleting a ticket
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title             | description                   |
      | Make it shiny!    | Gradients! Starbursts! Oh my! |
    And I am on the homepage
    When I follow "TextMate 2"
    And follow "Make it shiny!"
    When I follow "Delete Ticket"
    Then I should be on the project page for "TextMate 2"
    And I should see "Ticket has been deleted."
    And I should not see "Make it shiny!"
