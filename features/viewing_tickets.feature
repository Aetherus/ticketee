Feature: Viewing tickets
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given there is the following user:
      | email             | password |
      | user@ticketee.com | P@ssw0rd |
    And I am signed in as it
    Given there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title           | description                     |
      | Make it shiny!  | Gradients! Starbursts! Oh my!   |
    Given there is a project called "Internet Explorer"
    And "user@ticketee.com" has created a ticket for this project:
      | title                 | description   |
      | Standards compliance  | Isn't a joke. |
    And "user@ticketee.com" can view the "Internet Explorer" project
    Given I am on the homepage

    Scenario: Viewing tickets for a given project
      When I follow "TextMate 2"
      Then I should see "Make it shiny!"
      And I should not see "Standards compliance"
      When I follow "Make it shiny!"
      Then I should see "Make it shiny" within "#ticket h2"
      And I should see "Gradients! Starbursts! Oh my!"

      When I follow "Ticketee"
      And I follow "Internet Explorer"
      Then I should see "Standards compliance"
      And I should not see "Make it shiny!"
      When I follow "Standards compliance"
      Then I should see "Standards compliance" within "#ticket h2"
      And I should see "Isn't a joke."

