Feature: Ownership of Booked Desks

  As a desk user
  I want my booked desks to be protected from unauthorized modifications
  So that my reservations are secure

  Background:
    Given the desk booking system is operational

  Scenario: User attempts to modify another user's booking
    Given User A has booked a desk for "2023-06-15"
    When User B attempts to modify User A's booking
    Then the system should prevent the modification
    And display a message that the booking belongs to another user

  Scenario: Admin modifies a user's booking
    Given User A has booked a desk for "2023-06-20"
    When an admin modifies User A's booking
    Then the system should allow the modification
    And notify User A about the change made by the admin

  Scenario: User cancels their own booking
    Given User A has booked a desk for "2023-06-25"
    When User A cancels their booking
    Then the system should allow the cancellation
    And the desk should become available for booking by others

  Scenario: User attempts to extend another user's booking
    Given User A has booked a desk for "2023-07-01" from 9 AM to 1 PM
    When User B attempts to extend the booking to 5 PM
    Then the system should prevent the modification
    And display a message that the booking cannot be modified by another user

  Scenario: Admin overrides a booking for emergency purposes
    Given User A has booked a desk for "2023-07-05"
    When an admin overrides the booking for emergency purposes
    Then the system should allow the override
    And notify User A about the cancellation
    And provide User A with alternative booking options

  Scenario: User modifies their own recurring booking
    Given User A has a recurring booking for Mondays for 4 weeks
    When User A modifies the recurring booking to Tuesdays
    Then the system should allow the modification
    And update all future bookings in the recurring series to Tuesdays