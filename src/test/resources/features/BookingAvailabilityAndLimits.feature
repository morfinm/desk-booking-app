Feature: Booking Availability and Limits

  As a user
  I want to book available desks for single or multiple consecutive days, within the allowed booking limits
  So that I can plan my office attendance efficiently

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Book a desk for a single day
    When the user attempts to book a desk for tomorrow
    Then the booking should be successful

  Scenario: Book a desk for multiple consecutive days
    When the user attempts to book a desk for the next 3 consecutive days
    Then the booking should be successful

  Scenario: Attempt to book multiple desks for the same day
    Given the user has already booked a desk for tomorrow
    When they attempt to book another desk for the same day
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Attempt to exceed the maximum booking limit
    Given the maximum booking limit is 7 days
    When the user attempts to book a desk for 8 consecutive days
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Attempt to exceed team/department booking policy
    Given the team has a policy of maximum 3 bookings per week
    And the user has already booked 3 days this week
    When they attempt to book another day in the same week
    Then the system should prevent the booking
    And display a message about the team policy limit

  Scenario: Book the last available desk
    Given there is only one desk available for tomorrow
    When two users attempt to book it simultaneously
    Then only one booking should be successful
    And the other user should receive a message that the desk is no longer available

  Scenario: System performance for booking validation
    Given multiple users are attempting to book desks simultaneously
    When the system validates their bookings
    Then the validation for each booking must occur in less than 2 seconds