Feature: Desk Booking and Selection

  As an employee
  I want to book an available desk for single or multiple consecutive days
  So that I can plan my workdays efficiently

  Background:
    Given the desk booking system is operational
    And I am logged in as an active employee

  Scenario: View available desks
    When I access the desk booking screen
    Then I should see only available desks and time slots

  Scenario: Book a desk for a single day
    When I select an available desk for tomorrow
    And I confirm the booking
    Then the booking should be successful
    And the desk should be marked as unavailable for that day

  Scenario: Book a desk for multiple consecutive days
    When I select an available desk for the next 3 working days
    And I confirm the booking
    Then the booking should be successful
    And the desk should be marked as unavailable for those 3 days

  Scenario: Attempt to book a desk for more than the maximum allowed duration
    Given the maximum booking duration is 7 days
    When I try to book a desk for 10 consecutive days
    Then the system should not allow the booking
    And I should see an error message about the maximum booking duration

  Scenario: Book a specific type of desk
    Given there are window seats available
    When I filter the available desks to show only window seats
    And I select an available window seat
    Then the booking should be successful
    And the selected desk should be a window seat

  Scenario: Real-time updates of desk availability
    Given I am viewing the desk booking screen
    When another user books a desk
    Then the availability of that desk should be immediately updated on my screen