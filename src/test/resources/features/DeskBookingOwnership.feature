Feature: Desk Booking Ownership

  As a user
  I want my booked desks to be protected from modification by others
  So that my reservations are secure

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Prevent modification of booking by another user
    Given User A has a confirmed desk booking
    When User B attempts to modify User A's booking
    Then the system should prevent the modification
    And display an appropriate error message to User B

  Scenario: Allow admin to modify user's booking
    Given a user has a confirmed desk booking
    When an admin attempts to modify the user's booking
    Then the system should allow the modification
    And log the admin's action
    And notify the user of the change

  Scenario: User modifies their own booking
    Given a user has a confirmed desk booking
    When they attempt to modify their own booking
    Then the system should allow the modification
    And update the booking details accordingly

  Scenario: Prevent cancellation of booking by another user
    Given User A has a confirmed desk booking
    When User B attempts to cancel User A's booking
    Then the system should prevent the cancellation
    And display an appropriate error message to User B

  Scenario: Allow admin to cancel user's booking
    Given a user has a confirmed desk booking
    When an admin cancels the user's booking
    Then the system should process the cancellation
    And log the admin's action
    And notify the user of the cancellation

  Scenario: User cancels their own booking
    Given a user has a confirmed desk booking
    When they cancel their own booking
    Then the system should process the cancellation
    And update the desk availability

  Scenario: Attempt to transfer booking ownership
    Given User A has a confirmed desk booking
    When they attempt to transfer the booking to User B
    Then the system should prevent the transfer
    And display an appropriate error message

  Scenario: System performance for booking modification checks
    Given multiple users are attempting to modify bookings simultaneously
    When the system checks the modification permissions
    Then each check should be completed in less than 1 second