Feature: Recurring Bookings Option

  As an employee
  I want to set up recurring desk bookings
  So that I can book desks in advance for consistent attendance schedules

  Background:
    Given the desk booking system is operational
    And I am logged in as an active employee

  Scenario: Create a weekly recurring booking
    When I create a recurring booking for every Monday for the next 4 weeks
    Then the system should create 4 separate bookings for the specified Mondays
    And I should see a confirmation of the recurring booking

  Scenario: Create a recurring booking with multiple days per week
    When I create a recurring booking for every Monday and Friday for the next 4 weeks
    Then the system should create 8 separate bookings for the specified days
    And I should see a confirmation of the recurring booking

  Scenario: Attempt to create a recurring booking with a conflict
    Given I have an existing booking for next Monday
    When I try to create a recurring booking for every Monday for the next 4 weeks
    Then the system should create bookings for the 3 non-conflicting Mondays
    And I should see a notification about the conflicting date

  Scenario: Modify a recurring booking
    Given I have a recurring booking for every Tuesday for the next 4 weeks
    When I modify the recurring booking to be for every Wednesday instead
    Then the system should update all future occurrences to Wednesday
    And I should see a confirmation of the updated recurring booking

  Scenario: Cancel a single occurrence of a recurring booking
    Given I have a recurring booking for every Thursday for the next 4 weeks
    When I cancel the booking for the second Thursday
    Then that specific booking should be cancelled
    But the other Thursday bookings should remain unchanged

  Scenario: Cancel an entire recurring booking series
    Given I have a recurring booking for every Friday for the next 4 weeks
    When I cancel the entire recurring booking series
    Then all future Friday bookings in this series should be cancelled
    And I should see a confirmation of the cancellation

  Scenario: Create a recurring booking with limited available desks
    Given there are limited desks available for the recurring dates
    When I create a recurring booking for every Monday for the next 4 weeks
    Then the system should create bookings for the available Mondays
    And I should see a notification about any dates where a desk wasn't available

  Scenario: Attempt to create a recurring booking beyond the allowed booking window
    Given the maximum advance booking time is 30 days
    When I try to create a recurring booking for every Monday for the next 8 weeks
    Then the system should create bookings only for the Mondays within the 30-day window
    And I should see a notification about bookings not created beyond the allowed window