Feature: Double Booking and Conflict Management

  As a desk booking user
  I want the system to prevent overlapping bookings for the same desk
  So that double bookings don't occur and my reservations are reliable

  Background:
    Given the desk booking system is operational
    And I am logged in as an active employee

  Scenario: Attempt to book an already reserved desk
    Given desk A is already booked for tomorrow
    When I attempt to book desk A for the same day
    Then the booking should be denied
    And I should see a message indicating the desk is already booked

  Scenario: Book an available desk
    Given desk B is available for tomorrow
    When I book desk B for tomorrow
    Then the booking should be successful
    And desk B should now show as unavailable for tomorrow

  Scenario: Simultaneous booking attempts for the same desk
    Given desk C is available for next Monday
    When two users simultaneously attempt to book desk C for next Monday
    Then only one booking should be successful
    And the other user should receive a notification that the desk is no longer available

  Scenario: Admin overrides an existing booking
    Given I have booked desk D for next Tuesday
    When an admin overrides my booking for desk D
    Then I should receive a notification about the change to my booking
    And I should be offered alternative desk options

  Scenario: Booking a desk for a partial day
    Given desk E is booked for tomorrow morning
    When I attempt to book desk E for tomorrow afternoon
    Then the booking should be successful
    And the desk should show as partially available for tomorrow

  Scenario: System handles high volume of concurrent bookings
    Given there are 100 available desks
    When 200 users simultaneously attempt to book desks for the same day
    Then exactly 100 bookings should be successful
    And the remaining users should receive notifications about unavailability

  Scenario: Cancellation frees up a desk for booking
    Given all desks are booked for next Wednesday
    When a user cancels their booking for desk F
    And I immediately attempt to book desk F for next Wednesday
    Then my booking should be successful

  Scenario: Attempt to modify booking to create a conflict
    Given I have booked desk G for next Thursday
    And desk H is booked by another user for next Thursday
    When I attempt to modify my booking to desk H for the same day
    Then the modification should be denied
    And I should see a message indicating the desk is already booked