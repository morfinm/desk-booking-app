Feature: Active Office Membership Requirement

  As an employee or authorized user
  I want to be able to book a desk only if I have an active office membership or access permission
  So that only eligible users can reserve desks

  Background:
    Given the desk booking system is operational

  Scenario: User with active office membership books a desk
    Given a user with an active office membership
    When they attempt to book a desk
    Then the booking process should proceed successfully

  Scenario: User without active office membership attempts to book a desk
    Given a user without an active office membership
    When they attempt to book a desk
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: User's office membership expires
    Given a user with an active office membership
    And they have an existing desk booking
    When their office membership expires
    Then they should be notified about the expiration
    And their existing booking should be cancelled

  Scenario: User regains active office membership
    Given a user without an active office membership
    When their office membership is reactivated
    Then they should be able to book a desk successfully

  Scenario: System performance for eligibility check
    Given multiple users are attempting to book desks simultaneously
    When the system checks their eligibility
    Then the response time for each eligibility check should be less than 2 seconds