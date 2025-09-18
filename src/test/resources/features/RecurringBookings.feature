Feature: Recurring Bookings

  As a desk user
  I want to set up recurring bookings for specific days
  So that I can reserve desks for regular office attendance

  Background:
    Given the desk booking system is operational

  Scenario: User creates a recurring booking for available desks
    Given there are available desks for the next 4 Mondays
    When the user creates a recurring booking for Mondays for the next 4 weeks
    Then the system should create bookings for all 4 Mondays
    And confirm the recurring booking to the user

  Scenario: User attempts to create a recurring booking with some conflicts
    Given there are available desks for the next 4 Wednesdays
    But the third Wednesday is fully booked
    When the user creates a recurring booking for Wednesdays for the next 4 weeks
    Then the system should create bookings for 3 available Wednesdays
    And notify the user about the conflict on the third Wednesday
    And offer alternative desks or dates for the conflicting booking

  Scenario: User modifies a recurring booking
    Given the user has a recurring booking for Fridays for 4 weeks
    When the user changes the recurring booking to Thursdays
    Then the system should update all future bookings to Thursdays
    And confirm the changes to the user

  Scenario: User cancels a recurring booking
    Given the user has a recurring booking for Tuesdays for 4 weeks
    When the user cancels the entire recurring booking
    Then the system should cancel all future Tuesday bookings
    And confirm the cancellation to the user

  Scenario: User creates a recurring booking exceeding allowed duration
    Given the maximum allowed recurring booking duration is 8 weeks
    When the user attempts to create a recurring booking for 10 weeks
    Then the system should create bookings for only 8 weeks
    And notify the user that the booking was limited to the maximum allowed duration

  Scenario: User creates multiple recurring bookings
    Given the user has no existing recurring bookings
    When the user creates a recurring booking for Mondays and Wednesdays for 4 weeks
    Then the system should create separate recurring bookings for Mondays and Wednesdays
    And confirm both recurring bookings to the user