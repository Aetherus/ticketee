Feature: Signing up
  In order to be attributed to my work
  As a user
  I want ot be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "P@ssw0rd"
    And I fill in "Password confirmation" with "P@ssw0rd"
    And I press "Sign up"
    Then I should see "You have signed up successfully."
