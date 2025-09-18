Feature: Booking Availability and Limits

  As a desk user
  I want to book desks for available time slots and within allowed limits
  So that I comply with booking policies and avoid conflicts

  Background:
    Given the desk booking system is operational
    And the maximum booking limit is set to 7 days

  Scenario: User books a desk within limits
    Given there are available desks
    When a user selects a desk for 3 days
    Then the system should allow the booking

  Scenario: User attempts to book multiple desks for the same day
    Given a user has already booked a desk for today
    When they attempt to book another desk for the same day
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: User attempts to exceed weekly booking limit
    Given a user has booked desks for 6 days this week
    When they attempt to book a desk for 2 more days
    Then the system should allow booking for 1 day
    And prevent booking for the second day
    And display a message about reaching the weekly limit

  Scenario: User books a desk respecting team limits
    Given the user's team has a daily limit of 5 desk bookings
    And 4 desks have already been booked by team members
    When the user attempts to book a desk
    Then the system should allow the booking

  Scenario: User attempts to exceed team booking limit
    Given the user's team has a daily limit of 5 desk bookings
    And 5 desks have already been booked by team members
    When the user attempts to book a desk
    Then the system should prevent the booking
    And display a message about reaching the team's daily limit