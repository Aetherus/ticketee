Feature: Signing in
  In order to revisit the site
  As a user
  I want a form for me to sign in again

Scenario: Signing in via form
  Given there is a following user:
    | email             | password | confirmation_required  |
    | user@ticketee.com | P@ssw0rd | true                   |
  And I am on the homepage
  When I follow "Sign in"
  And fill in "Email" with "user@ticketee.com"
  And fill in "Password" with "P@ssw0rd"
  And press "Sign in"
  Then I should see "Signed in successfully."
  And I should see "Signed in as user@ticketee.com"
