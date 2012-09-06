Feature: Signing in
  In order to revisit the site
  As a user
  I want a form for me to sign in again

Scenario: Signing in via form
  Given there is a following user:
    | email             | password | confirmation_required  |
    | user@ticketee.com | P@ssw0rd | true                   |
  And I am signed in as it
  And I should see "Signed in as user@ticketee.com"
