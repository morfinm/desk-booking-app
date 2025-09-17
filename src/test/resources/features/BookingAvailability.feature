Feature: Booking Desks for Available Time Slots

  As a user
  I want to book desks only for available time slots
  So that I avoid conflicts with other bookings

  Background:
    Given the desk booking system is open
    And I am logged in as a user with active office membership

  Scenario: Book an available desk
    Given there is an available desk for the desired time slot
    When I attempt to book the desk
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Attempt to book an unavailable desk
    Given there is no available desk for the desired time slot
    When I attempt to book a desk
    Then the system should prevent the booking
    And display an error message "No desks available for the selected time slot"

  Scenario: Book the last available desk
    Given there is only one desk available for the desired time slot
    When I book the desk
    Then the system should allow the booking
    And update the availability status for that time slot

  Scenario: Multiple users trying to book the same desk simultaneously
    Given there is one desk available for a specific time slot
    When multiple users attempt to book the desk at the same time
    Then only one user should successfully book the desk
    And other users should receive an error message "Desk no longer available"