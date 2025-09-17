Feature: Booking Availability
  As a user
  I want to book desks only for available time slots
  So that I avoid conflicts with other bookings

  Background:
    Given the desk booking system is operational

  Scenario: Successful desk booking for available time slot
    Given there is an available desk for the desired time slot
    When I select the time slot and attempt to book the desk
    Then the system should allow the booking
    And I should receive a confirmation of my booking

  Scenario: Unsuccessful desk booking for unavailable time slot
    Given there is no available desk for the desired time slot
    When I select the time slot and attempt to book the desk
    Then the system should prevent the booking
    And I should see an error message stating "Selected time slot is unavailable"

  Scenario: Booking becomes unavailable during selection process
    Given there is an available desk for the desired time slot
    When another user books the desk before I complete my booking
    And I attempt to book the same desk
    Then the system should prevent the booking
    And I should see an error message stating "This desk is no longer available"