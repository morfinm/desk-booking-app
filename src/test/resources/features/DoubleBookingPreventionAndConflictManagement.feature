Feature: Double Booking Prevention and Conflict Management

  As a desk user
  I want the system to prevent double booking and notify me of conflicts
  So that my bookings are reliable and conflicts are resolved

  Background:
    Given the desk booking system is operational

  Scenario: System prevents double booking of a desk
    Given a desk is booked for "2023-06-15" from 9 AM to 5 PM
    When another user attempts to book the same desk for "2023-06-15" from 1 PM to 3 PM
    Then the system should prevent the booking
    And display a message that the desk is already booked for that time

  Scenario: User is notified when a booked desk becomes unavailable
    Given a user has booked a desk for "2023-06-20"
    When the desk is marked as unavailable due to maintenance
    Then the user should receive a notification about the conflict
    And the system should offer alternative desk options

  Scenario: System handles overlapping booking attempts
    Given a desk is available for "2023-06-25"
    When two users simultaneously attempt to book the desk for the same time slot
    Then the system should allow only one booking to succeed
    And the other user should receive a notification that the desk is no longer available

  Scenario: Admin overrides a booking due to office reconfiguration
    Given a user has booked a desk for "2023-07-01"
    When an admin marks the desk as unavailable due to office reconfiguration
    Then the user should be notified about the cancellation
    And the system should automatically attempt to book a similar desk for the user

  Scenario: System suggests alternative desks for a conflicting booking
    Given all desks in the user's preferred area are booked for "2023-07-05"
    When the user attempts to book a desk in that area for "2023-07-05"
    Then the system should inform the user that the preferred area is fully booked
    And suggest available desks in nearby areas

  Scenario: User modifies booking to resolve conflict
    Given a user has booked a desk for "2023-07-10" from 9 AM to 5 PM
    And the desk becomes unavailable from 2 PM due to maintenance
    When the user is notified of the conflict
    Then the user should be able to modify their booking to end at 2 PM
    And the system should confirm the updated booking