Feature: Booking Limits

  As a user
  I want to book only one desk per day and adhere to team/department booking policies
  So that I can follow company guidelines and ensure fair desk allocation

  Background:
    Given the user is on the desk booking page

  Scenario: Book one desk for a day
    When the user books a desk for a specific day
    Then the booking should be successful

  Scenario: Attempt to book a second desk for the same day
    Given the user has already booked a desk for today
    When the user attempts to book another desk for the same day
    Then the booking should be denied
    And an error message should be displayed indicating the one-desk-per-day limit

  Scenario: Book desks within team/department policy limits
    Given the user's team has a limit of 3 bookings per week
    When the user books 3 desks for different days in the same week
    Then all bookings should be successful

  Scenario: Attempt to exceed team/department booking policy
    Given the user's team has a limit of 3 bookings per week
    And the user has already booked 3 desks this week
    When the user attempts to book another desk for this week
    Then the booking should be denied
    And an error message should be displayed indicating the team booking limit has been reached