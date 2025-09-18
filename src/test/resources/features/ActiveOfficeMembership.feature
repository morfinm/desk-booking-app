Feature: Active Office Membership Requirement

  As an employee or authorized office member
  I want to book a desk only if I have active office access
  So that desk usage is restricted to eligible users

  Background:
    Given the desk booking system is operational

  Scenario: User with active office membership books a desk
    Given a user with active office membership
    When they attempt to book a desk
    Then the booking process should proceed successfully

  Scenario: User without active office membership attempts to book a desk
    Given a user without active office membership
    When they attempt to book a desk
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: User's office membership status changes
    Given a user with active office membership
    And they have successfully booked a desk
    When their office membership becomes inactive
    Then they should be notified about the change
    And their future bookings should be cancelled

  Scenario: Reactivation of office membership
    Given a user without active office membership
    When their office membership is reactivated
    Then they should be able to book a desk successfully