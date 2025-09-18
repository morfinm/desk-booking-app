Feature: Booking Timeframe Enforcement

  As a desk user
  I want to book desks up to 30 days in advance and no earlier than 1 hour before the desired time
  So that booking windows are enforced

  Background:
    Given the desk booking system is operational

  Scenario: User books a desk within the allowed timeframe
    Given the current date is "2023-06-01 10:00:00"
    When the user attempts to book a desk for "2023-06-15 09:00:00"
    Then the system should allow the booking

  Scenario: User attempts to book a desk more than 30 days in advance
    Given the current date is "2023-06-01 10:00:00"
    When the user attempts to book a desk for "2023-07-02 09:00:00"
    Then the system should prevent the booking
    And display a message about the 30-day advance booking limit

  Scenario: User attempts to book a desk less than 1 hour in advance
    Given the current date is "2023-06-01 10:00:00"
    When the user attempts to book a desk for "2023-06-01 10:30:00"
    Then the system should prevent the booking
    And display a message about the 1-hour minimum advance booking requirement

  Scenario: User books a desk exactly 30 days in advance
    Given the current date is "2023-06-01 10:00:00"
    When the user attempts to book a desk for "2023-07-01 10:00:00"
    Then the system should allow the booking

  Scenario: User books a desk exactly 1 hour in advance
    Given the current date is "2023-06-01 10:00:00"
    When the user attempts to book a desk for "2023-06-01 11:00:00"
    Then the system should allow the booking