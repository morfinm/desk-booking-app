Feature: Booking Timeframe
  As a user
  I want to book desks up to 30 days in advance but no earlier than 1 hour before the desired time
  So that I plan my bookings effectively

  Background:
    Given the desk booking system is operational
    And I am a user with active office membership

  Scenario: Successful booking within allowed timeframe
    Given the current date is "2023-06-01 10:00:00"
    When I attempt to book a desk for "2023-06-15 14:00:00"
    Then the system should allow the booking
    And I should receive a confirmation of my booking

  Scenario: Unsuccessful booking more than 30 days in advance
    Given the current date is "2023-06-01 10:00:00"
    When I attempt to book a desk for "2023-07-02 14:00:00"
    Then the system should prevent the booking
    And I should see an error message stating "Bookings can only be made up to 30 days in advance"

  Scenario: Unsuccessful booking less than 1 hour in advance
    Given the current date is "2023-06-01 10:00:00"
    When I attempt to book a desk for "2023-06-01 10:30:00"
    Then the system should prevent the booking
    And I should see an error message stating "Bookings must be made at least 1 hour in advance"

  Scenario: Successful booking exactly 30 days in advance
    Given the current date is "2023-06-01 10:00:00"
    When I attempt to book a desk for "2023-07-01 10:00:00"
    Then the system should allow the booking
    And I should receive a confirmation of my booking

  Scenario: Successful booking exactly 1 hour in advance
    Given the current date is "2023-06-01 10:00:00"
    When I attempt to book a desk for "2023-06-01 11:00:00"
    Then the system should allow the booking
    And I should receive a confirmation of my booking