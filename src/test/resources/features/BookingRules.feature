Feature: Desk Booking Rules

  Background:
    Given the user is logged into the desk booking system

  Scenario: Active employee can book a desk
    Given the user has an active office membership
    When the user attempts to book a desk
    Then the booking should be successful

  Scenario: Inactive employee cannot book a desk
    Given the user does not have an active office membership
    When the user attempts to book a desk
    Then the booking should be prevented
    And an appropriate error message should be displayed

  Scenario: Employee can book an available desk
    Given a desk is available for a specific time slot
    When the user attempts to book the desk
    Then the booking should be confirmed

  Scenario: Employee cannot book an unavailable desk
    Given a desk is unavailable for a specific time slot
    When the user attempts to book the desk
    Then the booking should be prevented
    And an appropriate error message should be displayed

  Scenario: Employee can book one desk per day
    Given the user has not booked a desk for the day
    When the user attempts to book a desk
    Then the booking should be successful

  Scenario: Employee cannot book multiple desks for the same day
    Given the user has already booked a desk for the day
    When the user attempts to book another desk
    Then the booking should be prevented
    And an appropriate error message should be displayed

  Scenario: Employee can book a desk within the allowed timeframe
    Given the booking date is within 30 days from today
    And the booking time is at least 1 hour from now
    When the user attempts to book a desk
    Then the booking should be successful

  Scenario: Employee cannot book a desk more than 30 days in advance
    Given the booking date is more than 30 days from today
    When the user attempts to book a desk
    Then the booking should be prevented
    And an appropriate error message should be displayed

  Scenario: Employee cannot book a desk less than 1 hour in advance
    Given the booking time is less than 1 hour from now
    When the user attempts to book a desk
    Then the booking should be prevented
    And an appropriate error message should be displayed

  Scenario: Employee can select an available desk
    Given a specific desk is available
    When the user attempts to select and book the desk
    Then the booking should be confirmed for that specific desk

  Scenario: Employee can set up a recurring booking
    Given a desk is available for recurring bookings
    When the user sets up a recurring booking
    Then the recurring booking should be confirmed
    And all recurring bookings should be displayed clearly when viewing bookings