Feature: Hidden Links
  In order to clean up the user experience
  As a the system
  I want to hide links from users who can't act on them

  Background:
    Given there are the following users:
      | email                 | password  | admin  |
      | user@ticketee.com     | P@ssw0rd  | false  |
      | admin@ticketee.com    | P@ssw0rd  | true   |
      | ticketer@ticketee.com | P@ssw0rd  | false  |
    And there is a project called "TextMate 2"
    And "ticketer@ticketee.com" has created a ticket for this project:
      | title   | description           |
      | Shiny!  | Gradients! Yummy!     |
    And "user@ticketee.com" can view the "TextMate 2" project

  #New link
  Scenario: New project link is hidden for non-signed-in users
    Given I am on the homepage
    Then I should not see "New Project" link

  Scenario: New project link is hidden for standard users
    Given I am on the homepage
    And I am signed in as "user@ticketee.com"
    Then I should not see "New Project" link

  Scenario: New project link is shown to admins
    Given I am on the homepage
    And I am signed in as "admin@ticketee.com"
    Then I should see "New Project" link

  #Edit link
  # No longer needed because tickets are embedded to projects
  # and to view projects, users are required to be signed in.
#  Scenario: Edit project link is hidden for non-signed-in users
#    Given I am on the homepage
#    When I follow "TextMate 2"
#    Then I should not see "Edit Project" link

  Scenario: Edit project link is hidden for standard users
    Given I am on the homepage
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see "Edit Project" link

  Scenario: Edit project link is shown to admins
    Given I am on the homepage
    And I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see "Edit Project" link

  #Delete link
  # No longer needed because tickets are embedded to projects
  # and to view projects, users are required to be signed in.
#  Scenario: New project link is hidden for non-signed-in users
#    Given I am on the homepage
#    When I follow "TextMate 2"
#    Then I should not see "Delete Project" link

  Scenario: New project link is hidden for standard users
    Given I am on the homepage
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see "Delete Project" link

  Scenario: New project link is shown to admins
    Given I am on the homepage
    And I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see "Delete Project" link

  Scenario: New ticket links is shown to users with permission
    Given "user@ticketee.com" can create tickets for the "TextMate 2" project
    Given I am signed in as "user@ticketee.com"
    And I am on the project page for "TextMate 2"
    Then I should see "New Ticket" link

  Scenario: New ticket links is hidden for users without permission
    Given I am signed in as "user@ticketee.com"
    And I am on the project page for "TextMate 2"
    Then I should not see "New Ticket" link

  Scenario: New ticket links is shown to admins
    Given I am signed in as "admin@ticketee.com"
    And I am on the project page for "TextMate 2"
    Then I should see "New Ticket" link

  Scenario: Edit ticket link shown to users with permission
    Given "user@ticketee.com" can edit tickets for the "TextMate 2" project
    Given I am signed in as "user@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should see "Edit Ticket" link

  Scenario: Edit ticket link hidden for users without permission
    Given I am signed in as "user@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should not see "Edit Ticket" link

  Scenario: Edit ticket link shown to admins
    Given I am signed in as "admin@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should see "Edit Ticket" link

  Scenario: Delete ticket link shown to users with permission
    Given "user@ticketee.com" can delete tickets for the "TextMate 2" project
    Given I am signed in as "user@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should see "Delete Ticket" link

  Scenario: Delete ticket link hidden for users without permission
    Given I am signed in as "user@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should not see "Delete Ticket" link

  Scenario: Edit ticket link shown to admins
    Given I am signed in as "admin@ticketee.com"
    And I am on the ticket page for "Shiny!" of "TextMate 2" project
    Then I should see "Delete Ticket" link
