Feature: Deleting Projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear

  Scenario: Deleting a project
    Given there is the following user:
      | email               | password  | admin   |
      | admin@ticketee.com  | P@ssw0rd  | true    |
    And I am signed in as it
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    And follow "Delete Project"
    Then I should see "Project has been deleted."
    Then I should not see "TextMate 2"