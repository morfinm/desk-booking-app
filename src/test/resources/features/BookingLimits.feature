Feature: Booking Limits for Desks

  As a user
  I want to book only one desk per day and adhere to team/department policies
  So that I comply with organizational rules

  Background:
    Given the desk booking system is open
    And I am logged in as a user with active office membership

  Scenario: Book one desk for a day
    Given I have not booked any desks for today
    When I attempt to book a desk for today
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Attempt to book a second desk for the same day
    Given I have already booked a desk for today
    When I attempt to book another desk for today
    Then the system should prevent the booking
    And display an error message "You have already booked a desk for today"

  Scenario: Book desks within team/department weekly limit
    Given my team has a limit of 3 bookings per week
    And I have booked 2 desks this week
    When I attempt to book another desk for this week
    Then the system should allow the booking
    And display a confirmation message

  Scenario: Attempt to exceed team/department weekly limit
    Given my team has a limit of 3 bookings per week
    And I have already booked 3 desks this week
    When I attempt to book another desk for this week
    Then the system should prevent the booking
    And display an error message "Weekly team booking limit reached"

  Scenario: Book desk for another day in the same week
    Given I have booked a desk for today
    When I attempt to book a desk for tomorrow
    Then the system should allow the booking
    And display a confirmation message