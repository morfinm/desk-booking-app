Feature: Desk Selection and Restrictions

  As a desk user
  I want to select specific desks based on availability and restrictions
  So that I can choose preferred locations and comply with desk policies

  Background:
    Given the desk booking system is operational

  Scenario: User books an available unrestricted desk
    Given there is an available unrestricted desk
    When the user selects and attempts to book the desk
    Then the system should allow the booking

  Scenario: User attempts to book an unavailable desk
    Given there is an unavailable desk
    When the user attempts to book the desk
    Then the system should prevent the booking
    And display a message that the desk is unavailable

  Scenario: Authorized user books a restricted desk
    Given there is an available restricted desk
    And the user is authorized to book restricted desks
    When the user selects and attempts to book the restricted desk
    Then the system should allow the booking

  Scenario: Unauthorized user attempts to book a restricted desk
    Given there is an available restricted desk
    And the user is not authorized to book restricted desks
    When the user attempts to book the restricted desk
    Then the system should prevent the booking
    And display a message about insufficient permissions

  Scenario: User books a desk with specific attributes
    Given there are available desks with different attributes
    When the user filters desks by "window seat" and "standing desk"
    And selects an available desk matching the criteria
    Then the system should allow the booking of the selected desk

  Scenario: User attempts to book a desk restricted to another team
    Given there is an available desk restricted to Team A
    And the user belongs to Team B
    When the user attempts to book the desk restricted to Team A
    Then the system should prevent the booking
    And display a message about team-specific desk restrictions