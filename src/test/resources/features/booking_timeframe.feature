Feature: Booking Timeframe

  As a user
  I want to book desks up to 30 days in advance but no earlier than 1 hour before the desired time
  So that I can plan ahead while allowing for last-minute bookings

  Background:
    Given the user is on the desk booking page

  Scenario: Book a desk for the current day
    When the user attempts to book a desk for a time slot more than 1 hour from now
    Then the booking should be successful

  Scenario: Attempt to book a desk less than 1 hour in advance
    When the user attempts to book a desk for a time slot less than 1 hour from now
    Then the booking should be denied
    And an error message should be displayed indicating the minimum advance booking time

  Scenario: Book a desk 30 days in advance
    When the user attempts to book a desk exactly 30 days from now
    Then the booking should be successful

  Scenario: Attempt to book a desk more than 30 days in advance
    When the user attempts to book a desk 31 days from now
    Then the booking should be denied
    And an error message should be displayed indicating the maximum advance booking time

  Scenario: Book a desk between 1 hour and 30 days in advance
    When the user attempts to book a desk 15 days from now
    Then the booking should be successful