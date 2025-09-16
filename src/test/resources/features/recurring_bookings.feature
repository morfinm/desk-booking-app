Feature: Recurring Bookings

  As a user
  I want to set up recurring bookings for specific days based on desk availability
  So that I can secure a workspace for regular office visits

  Background:
    Given the user is on the desk booking page

  Scenario: Set up a weekly recurring booking
    When the user sets up a recurring booking for every Monday for the next 4 weeks
    And all selected dates are available
    Then the recurring booking should be successful

  Scenario: Attempt to set up a recurring booking with unavailable dates
    When the user sets up a recurring booking for every Wednesday for the next 4 weeks
    And one of the Wednesdays is not available
    Then the system should not allow the recurring booking
    And display an error message indicating the conflicting date

  Scenario: Set up a recurring booking for multiple days per week
    When the user sets up a recurring booking for Monday, Wednesday, and Friday for the next 2 weeks
    And all selected dates are available
    Then the recurring booking should be successful

  Scenario: Modify an existing recurring booking
    Given the user has an existing recurring booking for every Tuesday
    When the user changes the recurring booking to every Thursday
    And all new dates are available
    Then the modified recurring booking should be successful

  Scenario: Cancel a recurring booking
    Given the user has an existing recurring booking
    When the user cancels the recurring booking
    Then all future occurrences of the booking should be removed