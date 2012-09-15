Feature: Seed Data
  In order to fill the database with basics
  As a the system
  I want to run the seed task

  Scenario: The Basics
    Given I have run the seed task
    When I am signed in as "seed@ticketee.com"
    Then I should see "Ticketee Beta"