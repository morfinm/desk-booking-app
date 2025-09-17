Feature: Active Office Membership for Desk Booking

  As an employee
  I want to book a desk only if I have active office membership
  So that I comply with organizational policies

  Background:
    Given the desk booking system is open

  Scenario: Employee with active office membership books a desk
    Given I am an employee with active office membership
    When I attempt to book a desk
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Employee without active office membership attempts to book a desk
    Given I am an employee without active office membership
    When I attempt to book a desk
    Then the system should prevent the booking
    And display an error message "Active office membership required for desk booking"

  Scenario: Employee's office membership expires
    Given I am an employee with active office membership
    And I have booked a desk for tomorrow
    When my office membership expires
    Then the system should cancel my existing booking
    And notify me about the cancellation