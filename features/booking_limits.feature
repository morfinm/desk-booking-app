Feature: Booking Limits
  As a user
  I want to book only one desk per day
  So that I adhere to the booking limits

  Background:
    Given the desk booking system is operational
    And I am a user with active office membership

  Scenario: Successful first desk booking of the day
    Given I have not booked any desks for today
    When I attempt to book a desk for today
    Then the system should allow the booking
    And I should receive a confirmation of my booking

  Scenario: Unsuccessful second desk booking for the same day
    Given I have already booked a desk for today
    When I attempt to book another desk for the same day
    Then the system should prevent the booking
    And I should see an error message stating "You have reached the maximum number of desk bookings for today"

  Scenario: Successful booking for different days
    Given I have booked a desk for today
    When I attempt to book a desk for tomorrow
    Then the system should allow the booking
    And I should receive a confirmation of my booking for tomorrow

  Scenario: Booking limit resets each day
    Given I have booked a desk for yesterday
    And it is now a new day
    When I attempt to book a desk for today
    Then the system should allow the booking
    And I should receive a confirmation of my booking