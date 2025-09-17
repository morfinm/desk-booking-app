Feature: Desk Selection
  As a user
  I want to select specific desks based on availability
  So that I can choose a desk that suits my preferences

  Background:
    Given the desk booking system is operational
    And I am a user with active office membership

  Scenario: Successful booking of an available desk
    Given there is an available desk "A1" for the desired time slot
    When I select desk "A1" and attempt to book it
    Then the system should allow the booking
    And I should receive a confirmation of my booking for desk "A1"

  Scenario: Unsuccessful booking of an unavailable desk
    Given desk "B2" is unavailable for the desired time slot
    When I select desk "B2" and attempt to book it
    Then the system should prevent the booking
    And I should see an error message stating "Desk B2 is not available for the selected time slot"

  Scenario: Booking a restricted desk with authorization
    Given there is a restricted desk "C3" for the desired time slot
    And I have authorization to book restricted desks
    When I select desk "C3" and attempt to book it
    Then the system should allow the booking
    And I should receive a confirmation of my booking for desk "C3"

  Scenario: Attempting to book a restricted desk without authorization
    Given there is a restricted desk "C3" for the desired time slot
    And I do not have authorization to book restricted desks
    When I select desk "C3" and attempt to book it
    Then the system should prevent the booking
    And I should see an error message stating "You are not authorized to book desk C3"

  Scenario: Viewing available desks
    Given there are multiple desks available for the desired time slot
    When I view the list of available desks
    Then I should see all the available desks with their details
    And I should be able to select a desk from the list