Feature: Double Booking Prevention and Conflict Management

  As a user
  I want the system to prevent double booking and notify me if my booking is affected by maintenance or admin actions
  So that I am always aware of my desk status

  Background:
    Given the desk booking system is operational
    And the user has an active office membership

  Scenario: Prevent double booking for the same desk
    Given a desk is already booked for a specific date and time
    When another user attempts to book the same desk for the same time
    Then the system should prevent the booking
    And display an appropriate error message

  Scenario: Notify user of booking cancellation due to maintenance
    Given a user has a confirmed desk booking
    When an admin schedules maintenance for that desk during the booked time
    Then the system should cancel the user's booking
    And send a notification to the user about the cancellation
    And suggest alternative desks

  Scenario: Notify user of booking modification due to admin action
    Given a user has a confirmed desk booking
    When an admin needs to modify the booking for organizational reasons
    Then the system should update the user's booking
    And send a notification to the user about the change
    And provide details of the modified booking

  Scenario: Prevent overlapping bookings for the same user
    Given a user has a confirmed desk booking
    When they attempt to book another desk for an overlapping time period
    Then the system should prevent the new booking
    And display an appropriate error message

  Scenario: Handle simultaneous booking attempts
    Given a desk is available
    When multiple users attempt to book the same desk simultaneously
    Then the system should allow only one booking to succeed
    And prevent the other booking attempts
    And display appropriate messages to the users

  Scenario: Suggest alternatives for unavailable desk
    Given a user attempts to book a desk that becomes unavailable
    When the system detects the unavailability
    Then it should suggest alternative available desks nearby
    And allow the user to easily select an alternative

  Scenario: Admin override of existing booking
    Given a user has a confirmed desk booking
    When an admin overrides the booking for priority reasons
    Then the system should reassign the user to another available desk
    And notify the user of the change and reason

  Scenario: System performance for conflict resolution
    Given multiple booking conflicts occur simultaneously
    When the system resolves these conflicts
    Then each conflict should be resolved and users notified within 1 minute