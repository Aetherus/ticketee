Feature: Activating account
  In order to use the site
  As a user
  I want to be able to activate my account

  Scenario: Activating via confirmation
    Given there is the following user:
      | email               | password  | unconfirmed |
      | user@ticketee.com   | P@ssw0rd  | true        |
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And he clicks the first link in the email
    Then he should see "Your account was successfully confirmed."
    And he should see "Signed in as user@ticketee.com"