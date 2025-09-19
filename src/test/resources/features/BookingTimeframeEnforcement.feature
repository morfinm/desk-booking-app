Feature: Booking Timeframe Enforcement

  As an employee
  I want to book desks no more than 30 days in advance and no less than 1 hour before the start time
  So that bookings reflect current needs and availability

  Background:
    Given the desk booking system is operational
    And I am logged in as an active employee

  Scenario: Book a desk within the allowed timeframe
    When I attempt to book a desk for tomorrow
    Then the booking should be successful

  Scenario: Attempt to book a desk more than 30 days in advance
    When I attempt to book a desk for 31 days from now
    Then the booking should be rejected
    And I should see an error message about the maximum advance booking time

  Scenario: Attempt to book a desk less than 1 hour before start time
    When I attempt to book a desk for 30 minutes from now
    Then the booking should be rejected
    And I should see an error message about the minimum booking notice

  Scenario: Book a desk exactly 30 days in advance
    When I attempt to book a desk for exactly 30 days from now
    Then the booking should be successful

  Scenario: Book a desk exactly 1 hour before start time
    When I attempt to book a desk for exactly 1 hour from now
    Then the booking should be successful

  Scenario: Attempt to book a desk in the past
    When I attempt to book a desk for yesterday
    Then the booking should be rejected
    And I should see an error message about booking in the past

  Scenario: Book a desk across midnight
    When I attempt to book a desk from 11:00 PM today until 1:00 AM tomorrow
    Then the booking should be successful

  Scenario: Immediate validation of booking timeframe
    When I select a date for booking
    Then I should immediately see if the date is valid for booking without submitting the form