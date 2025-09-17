Feature: Desk Selection Based on Availability

  As a user
  I want to select specific desks based on availability
  So that I can choose a desk that suits my preferences

  Background:
    Given the desk booking system is open
    And I am logged in as a user with active office membership

  Scenario: Select an available desk
    Given there are multiple desks available for booking
    When I select a specific available desk
    Then the system should allow the selection
    And display a confirmation message

  Scenario: Attempt to select an unavailable desk
    Given there are some desks unavailable for booking
    When I attempt to select an unavailable desk
    Then the system should prevent the selection
    And display an error message "Selected desk is not available"

  Scenario: Select a desk with specific amenities
    Given there are desks available with different amenities
    When I filter desks by "standing desk" amenity
    And I select an available desk with a standing desk
    Then the system should allow the selection
    And display a confirmation message

  Scenario: Attempt to select a restricted desk without authorization
    Given there are some desks restricted to specific teams
    When I attempt to select a desk restricted to another team
    Then the system should prevent the selection
    And display an error message "You are not authorized to book this desk"

  Scenario: View desk availability on a floor plan
    Given I am on the desk booking page
    When I view the floor plan
    Then I should see available desks highlighted in green
    And unavailable desks highlighted in red
    And restricted desks highlighted in yellow