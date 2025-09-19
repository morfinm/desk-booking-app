Feature: Booking Limits Per User

  As an employee
  I want the system to restrict my bookings to one desk per day and within my department's policy
  So that fair use is ensured and resources are not monopolized

  Background:
    Given the desk booking system is operational
    And I am logged in as an active employee

  Scenario: Attempt to book multiple desks for the same day
    Given I have already booked a desk for today
    When I try to book another desk for the same day
    Then the booking should be denied
    And I should see a message indicating I can only book one desk per day

  Scenario: Book desks within weekly department limit
    Given my department has a limit of 3 bookings per week
    And I have already booked 2 desks this week
    When I book one more desk for this week
    Then the booking should be successful

  Scenario: Attempt to exceed weekly department booking limit
    Given my department has a limit of 3 bookings per week
    And I have already booked 3 desks this week
    When I try to book another desk for this week
    Then the booking should be denied
    And I should see a message about the weekly booking limit

  Scenario: Book desks across different weeks
    Given my department has a limit of 3 bookings per week
    And I have already booked 3 desks for this week
    When I book a desk for next week
    Then the booking should be successful

  Scenario: Department policy changes affect booking limits
    Given my department initially has a limit of 3 bookings per week
    And I have already booked 3 desks this week
    When the department policy is updated to allow 5 bookings per week
    Then I should be able to book 2 more desks for this week

  Scenario: Booking limits are applied instantly
    Given my department has a limit of 3 bookings per week
    And I have already booked 2 desks this week
    When I simultaneously attempt to book 2 more desks for this week
    Then only one booking should be successful
    And the other booking should be denied due to exceeding the weekly limit