Feature: Restricted Desk Booking

  As an authorized user
  I want to be able to book restricted desks only if I have appropriate permissions
  So that desks are reserved for those they are intended for

  Background:
    Given the desk booking system is operational
    And there are both restricted and unrestricted desks available

  Scenario: Authorized user books a restricted desk
    Given I am logged in as a user with permission to book restricted desks
    When I view the available desks
    Then I should see both restricted and unrestricted desks
    When I select a restricted desk
    And I confirm the booking
    Then the booking should be successful

  Scenario: Unauthorized user attempts to book a restricted desk
    Given I am logged in as a user without permission to book restricted desks
    When I view the available desks
    Then I should only see unrestricted desks
    And restricted desks should not be visible or selectable

  Scenario: Authorized user books an unrestricted desk
    Given I am logged in as a user with permission to book restricted desks
    When I view the available desks
    And I select an unrestricted desk
    And I confirm the booking
    Then the booking should be successful

  Scenario: User's permissions are updated
    Given I am logged in as a user without permission to book restricted desks
    When my permissions are updated to allow booking of restricted desks
    And I refresh the desk booking page
    Then I should now see both restricted and unrestricted desks

  Scenario: Attempt to directly access a restricted desk booking
    Given I am logged in as a user without permission to book restricted desks
    When I attempt to directly access the booking page for a restricted desk
    Then I should be denied access
    And I should see an error message about insufficient permissions

  Scenario: Booking a team-specific restricted desk
    Given I am logged in as a user with permission to book team A's restricted desks
    When I view the available desks
    Then I should see team A's restricted desks
    But I should not see restricted desks for other teams

  Scenario: System maintains security of restricted desk information
    Given I am logged in as a user without permission to book restricted desks
    When I inspect the page source or network requests
    Then I should not find any information about restricted desks