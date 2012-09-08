Feature: Signing in
  In order to revisit the site
  As a user
  I want a form for me to sign in again

Scenario: Signing in via form
  Given there is the following user:
    | email             | password |
    | user@ticketee.com | P@ssw0rd |
  And I am signed in as it
  And I should see "Signed in as user@ticketee.com"
