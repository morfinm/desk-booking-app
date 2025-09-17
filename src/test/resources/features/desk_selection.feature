Feature: Desk Selection

  As a user
  I want to select specific desks based on availability and restrictions
  So that I can choose a workspace that suits my preferences and permissions

  Background:
    Given the user is on the desk booking page

  Scenario: Book an available unrestricted desk
    When the user selects an available unrestricted desk
    And confirms the booking
    Then the booking should be successful

  Scenario: Attempt to book an unavailable desk
    When the user selects a desk that is already booked
    Then the system should not allow the booking
    And display an error message indicating the desk is unavailable

  Scenario: Book a window seat
    When the user filters for window seats
    And selects an available window seat
    Then the booking should be successful

  Scenario: Book a desk in a quiet zone
    When the user filters for quiet zone desks
    And selects an available quiet zone desk
    Then the booking should be successful

  Scenario: Authorized user books a team-specific desk
    Given the user is authorized for team-specific desks
    When the user selects an available team-specific desk
    Then the booking should be successful

  Scenario: Unauthorized user attempts to book a team-specific desk
    Given the user is not authorized for team-specific desks
    When the user attempts to select a team-specific desk
    Then the system should not allow the booking
    And display an error message indicating lack of authorization