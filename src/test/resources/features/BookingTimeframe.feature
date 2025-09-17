Feature: Booking Timeframe for Desks

  As a user
  I want to book desks up to 30 days in advance and no earlier than 1 hour before the desired time
  So that I plan my bookings effectively

  Background:
    Given the desk booking system is open
    And I am logged in as a user with active office membership

  Scenario: Book a desk within the allowed timeframe
    Given the current date is "2023-06-01 09:00"
    When I attempt to book a desk for "2023-06-15 14:00"
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Attempt to book a desk more than 30 days in advance
    Given the current date is "2023-06-01 09:00"
    When I attempt to book a desk for "2023-07-02 10:00"
    Then the system should prevent the booking
    And display an error message "Bookings can only be made up to 30 days in advance"

  Scenario: Attempt to book a desk less than 1 hour in advance
    Given the current date is "2023-06-01 09:00"
    When I attempt to book a desk for "2023-06-01 09:30"
    Then the system should prevent the booking
    And display an error message "Bookings must be made at least 1 hour in advance"

  Scenario: Book a desk exactly 30 days in advance
    Given the current date is "2023-06-01 09:00"
    When I attempt to book a desk for "2023-07-01 09:00"
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Book a desk exactly 1 hour in advance
    Given the current date is "2023-06-01 09:00"
    When I attempt to book a desk for "2023-06-01 10:00"
    Then the system should allow the booking
    And display a confirmation message