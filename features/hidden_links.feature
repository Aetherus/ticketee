Feature: Hidden Links
  In order to clean up the user experience
  As a the system
  I want to hide links from users who can't act on them

  Background:
    Given there are the following users:
      | email               | password  | admin  |
      | user@ticketee.com   | P@ssw0rd  | false  |
      | admin@ticketee.com  | P@ssw0rd  | true   |
    And there is a project called "TextMate 2"

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
  Scenario: Edit project link is hidden for non-signed-in users
    Given I am on the homepage
    When I follow "TextMate 2"
    Then I should not see "Edit Project" link

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
  Scenario: New project link is hidden for non-signed-in users
    Given I am on the homepage
    When I follow "TextMate 2"
    Then I should not see "Delete Project" link

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