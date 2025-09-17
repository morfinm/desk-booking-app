Feature: Active Office Membership
  As an employee
  I want to book a desk only if I have active office membership
  So that I comply with organizational policies

  Background:
    Given the desk booking system is operational

  Scenario: Successful desk booking with active office membership
    Given I am an employee with an active office membership
    When I attempt to book a desk
    Then the system should allow the booking
    And I should receive a confirmation of my booking

  Scenario: Unsuccessful desk booking without active office membership
    Given I am an employee without an active office membership
    When I attempt to book a desk
    Then the system should deny the booking
    And I should see an error message stating "Active office membership required for desk booking"

  Scenario: Membership status change affects booking ability
    Given I am an employee with an active office membership
    And I have successfully booked a desk
    When my office membership becomes inactive
    Then I should not be able to book any new desks
    And I should see an error message when attempting to book