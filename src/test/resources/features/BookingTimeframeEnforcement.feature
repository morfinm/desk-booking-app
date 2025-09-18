Feature: Booking Timeframe Enforcement

  As a user
  I want to book desks up to 30 days in advance and no earlier than 1 hour before the desired time
  So that bookings are managed within organizational policies

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Book a desk within the allowed timeframe
    When the user attempts to book a desk for 15 days from now
    Then the booking should be successful

  Scenario: Attempt to book a desk more than 30 days in advance
    When the user attempts to book a desk for 31 days from now
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Attempt to book a desk less than 1 hour before start time
    Given the current time is 9:30 AM
    When the user attempts to book a desk for 10:00 AM on the same day
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Book a desk exactly 30 days in advance
    When the user attempts to book a desk for exactly 30 days from now
    Then the booking should be successful

  Scenario: Book a desk exactly 1 hour before start time
    Given the current time is 9:00 AM
    When the user attempts to book a desk for 10:00 AM on the same day
    Then the booking should be successful

  Scenario: Attempt to book a desk for a past date
    When the user attempts to book a desk for yesterday
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Book a desk across different time zones
    Given the user is in a different time zone than the office
    When they attempt to book a desk for a valid future date in the office's time zone
    Then the booking should be successful
    And the booking time should be correctly adjusted for the office's time zone

  Scenario: System accuracy for time validation
    Given multiple users are attempting to book desks at various times
    When the system validates the booking times
    Then the time validation must be accurate to the minute