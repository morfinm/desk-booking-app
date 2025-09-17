Feature: Recurring Bookings for Desks

  As a user
  I want to set up recurring bookings
  So that I can reserve desks for regular use

  Background:
    Given the desk booking system is open
    And I am logged in as a user with active office membership

  Scenario: Set up a weekly recurring booking
    Given there is a desk available for the next 4 Mondays
    When I set up a recurring booking for every Monday for the next 4 weeks
    Then the system should create the recurring bookings
    And display a confirmation message with all booked dates

  Scenario: Attempt to set up a recurring booking with unavailable slots
    Given there is a desk available for the next 3 Tuesdays
    But the 4th Tuesday is unavailable
    When I attempt to set up a recurring booking for every Tuesday for the next 4 weeks
    Then the system should notify me about the unavailable date
    And offer to book only the available dates

  Scenario: Modify a recurring booking
    Given I have a recurring booking for every Wednesday for the next 4 weeks
    When I modify the recurring booking to change the desk
    Then the system should update all future occurrences of the booking
    And display a confirmation message with the updated booking details

  Scenario: Cancel a single occurrence of a recurring booking
    Given I have a recurring booking for every Thursday for the next 4 weeks
    When I cancel the booking for the 3rd Thursday
    Then the system should cancel only that specific occurrence
    And keep the other occurrences unchanged

  Scenario: Cancel an entire recurring booking series
    Given I have a recurring booking for every Friday for the next 4 weeks
    When I cancel the entire recurring booking series
    Then the system should cancel all future occurrences of the booking
    And display a confirmation message

  Scenario: Set up a recurring booking with a specific end date
    Given there are desks available for the next 2 months on Mondays
    When I set up a recurring booking for every Monday with an end date 2 months from now
    Then the system should create the recurring bookings until the specified end date
    And display a confirmation message with all booked dates