Feature: Desk Booking Ownership Control

  As a desk booker
  I want assurance that only admins can override or modify my booking
  So that my reservations are secure except for exceptional admin actions

  Background:
    Given the desk booking system is operational
    And there are multiple users and admins registered in the system

  Scenario: User attempts to modify another user's booking
    Given user A has a booking for desk X tomorrow
    And I am logged in as user B
    When I attempt to modify user A's booking
    Then the modification should be denied
    And I should see a message indicating I don't have permission to modify other users' bookings

  Scenario: User modifies their own booking
    Given I have a booking for desk Y next Monday
    When I modify my booking to change it to desk Z
    Then the modification should be successful
    And my updated booking should be for desk Z next Monday

  Scenario: Admin modifies a user's booking
    Given user C has a booking for desk W next Tuesday
    And I am logged in as an admin
    When I modify user C's booking to change it to desk V
    Then the modification should be successful
    And user C should receive a notification about the change to their booking

  Scenario: Admin cancels a user's booking
    Given user D has a booking for desk U next Wednesday
    And I am logged in as an admin
    When I cancel user D's booking
    Then the cancellation should be successful
    And user D should receive a notification about the cancellation of their booking

  Scenario: User attempts to cancel another user's booking
    Given user E has a booking for desk T next Thursday
    And I am logged in as user F
    When I attempt to cancel user E's booking
    Then the cancellation should be denied
    And I should see a message indicating I don't have permission to cancel other users' bookings

  Scenario: System logs admin actions on user bookings
    Given user G has a booking for desk S next Friday
    And I am logged in as an admin
    When I modify user G's booking
    Then the system should log the details of the modification
    And the log should include the admin's identification and the nature of the change

  Scenario: User views their booking history
    Given I have made several bookings over the past month
    When I view my booking history
    Then I should see all my past and future bookings
    And I should not see bookings made by other users

  Scenario: Admin views all booking history
    Given multiple users have made bookings over the past month
    And I am logged in as an admin
    When I view the overall booking history
    Then I should see bookings made by all users
    And I should be able to filter and search through the booking history