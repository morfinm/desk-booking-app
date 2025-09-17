Feature: Recurring Bookings
  As a user
  I want to set up recurring bookings
  So that I can reserve desks for regular use

  Background:
    Given the desk booking system is operational
    And I am a user with active office membership

  Scenario: Successful setup of a recurring booking
    Given desk "A1" is available for the next 4 Mondays
    When I set up a recurring booking for desk "A1" every Monday for 4 weeks
    Then the system should allow the recurring booking
    And I should receive a confirmation of my recurring booking for desk "A1"

  Scenario: Unsuccessful setup of a recurring booking due to partial unavailability
    Given desk "B2" is available for the next 3 Tuesdays but unavailable on the 4th Tuesday
    When I set up a recurring booking for desk "B2" every Tuesday for 4 weeks
    Then the system should notify me of the partial unavailability
    And suggest alternative desks or dates for the unavailable slot

  Scenario: Modifying a recurring booking
    Given I have a recurring booking for desk "C3" every Wednesday for 4 weeks
    When I modify the recurring booking to be for desk "C4" instead
    Then the system should update the recurring booking
    And I should receive a confirmation of the updated recurring booking for desk "C4"

  Scenario: Cancelling a recurring booking
    Given I have a recurring booking for desk "D4" every Thursday for 4 weeks
    When I cancel the recurring booking
    Then the system should cancel all future occurrences of the booking
    And I should receive a confirmation of the cancellation

  Scenario: Setting up a recurring booking with a specific end date
    Given desk "E5" is available every Friday until the end of the current month
    When I set up a recurring booking for desk "E5" every Friday until the end of the month
    Then the system should allow the recurring booking
    And I should receive a confirmation of my recurring booking for desk "E5" with the specified end date

  Scenario: Attempting to set up a conflicting recurring booking
    Given I have a recurring booking for desk "F6" every Monday for 4 weeks
    When I attempt to set up another recurring booking that conflicts with my existing booking
    Then the system should prevent the new recurring booking
    And I should see an error message stating "This recurring booking conflicts with your existing bookings"