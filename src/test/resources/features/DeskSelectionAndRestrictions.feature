Feature: Desk Selection and Restrictions

  As a user
  I want to select specific desks based on availability and restrictions
  So that I can choose a preferred workspace

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Book an available unrestricted desk
    Given there are available unrestricted desks
    When the user selects a specific unrestricted desk
    Then the booking should be successful

  Scenario: Attempt to book an unavailable desk
    Given a specific desk is already booked
    When the user attempts to book that desk
    Then the system should prevent the booking
    And display a message that the desk is unavailable

  Scenario: Book a window seat
    Given there are available window seats
    When the user selects a window seat
    Then the booking should be successful

  Scenario: Book a desk in a quiet zone
    Given there are available desks in the quiet zone
    When the user selects a desk in the quiet zone
    Then the booking should be successful

  Scenario: Attempt to book a team-specific desk without authorization
    Given there is an available team-specific desk
    And the user is not authorized for that team's desks
    When the user attempts to book the team-specific desk
    Then the system should prevent the booking
    And display a message about lack of authorization

  Scenario: Authorized user books a team-specific desk
    Given there is an available team-specific desk
    And the user is authorized for that team's desks
    When the user attempts to book the team-specific desk
    Then the booking should be successful

  Scenario: Book a desk with specific equipment
    Given there are available desks with specific equipment (e.g., dual monitors)
    When the user selects a desk with the required equipment
    Then the booking should be successful

  Scenario: System updates desk availability in real-time
    Given multiple users are viewing the desk selection interface
    When a desk is booked by one user
    Then the desk should immediately show as unavailable for other users