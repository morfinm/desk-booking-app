Feature: Recurring Bookings

  As a user
  I want to set up recurring desk bookings based on availability
  So that I can reserve a desk for regular office days

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Create a weekly recurring booking
    When the user sets up a recurring booking for every Monday for the next 4 weeks
    Then the system should check availability for each occurrence
    And confirm the booking for all available dates

  Scenario: Create a recurring booking with some unavailable dates
    When the user sets up a recurring booking for every Wednesday for the next 4 weeks
    And some of the requested dates are unavailable
    Then the system should confirm the booking for the available dates
    And notify the user about the unavailable dates
    And suggest alternatives for the unavailable dates

  Scenario: Modify a recurring booking
    Given the user has an existing recurring booking
    When they modify the recurring booking pattern
    Then the system should update the booking for all future occurrences
    And notify the user of any conflicts or changes

  Scenario: Cancel a recurring booking
    Given the user has an existing recurring booking
    When they cancel the entire recurring booking
    Then all future occurrences of the booking should be removed
    And the desks should become available for those dates

  Scenario: Create a recurring booking with different desks
    When the user sets up a recurring booking for different desks each time
    Then the system should check availability for each desk on each date
    And confirm the booking for all available desk-date combinations

  Scenario: Attempt to create a recurring booking exceeding policy limits
    Given the booking policy limits recurring bookings to 8 weeks
    When the user attempts to create a recurring booking for 10 weeks
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Create a recurring booking across daylight saving time changes
    When the user sets up a recurring booking that spans a daylight saving time change
    Then the system should adjust the booking times correctly for each occurrence

  Scenario: System performance for recurring booking processing
    Given multiple users are creating recurring bookings simultaneously
    When the system processes these recurring bookings
    Then each recurring booking should be processed in less than 5 seconds