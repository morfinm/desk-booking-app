Feature: Desk Booking Availability

  As a user
  I want to book desks for available time slots and for single or multiple consecutive days
  So that I can secure a workspace for my needed duration

  Background:
    Given the user is on the desk booking page

  Scenario: Book a desk for a single day
    When the user selects an available desk for a single day
    And confirms the booking
    Then the booking should be successful for that day

  Scenario: Book a desk for multiple consecutive days
    When the user selects an available desk for 3 consecutive days
    And confirms the booking
    Then the booking should be successful for all 3 days

  Scenario: Attempt to book an unavailable desk
    When the user selects a desk that is not available
    Then the system should not allow the booking
    And display an error message indicating the desk is unavailable

  Scenario: Book a desk for more than the maximum allowed consecutive days
    Given the maximum allowed consecutive booking days is 7
    When the user attempts to book a desk for 8 consecutive days
    Then the system should not allow the booking
    And display an error message indicating the maximum booking duration