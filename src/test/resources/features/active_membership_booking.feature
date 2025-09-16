Feature: Active Office Membership Booking

  As an employee
  I want to book a desk only if I have active office membership or access permissions
  So that I can ensure proper access control to office resources

  Background:
    Given the user is on the desk booking page

  Scenario: User with active membership can book a desk
    Given the user has an active office membership
    When the user attempts to book a desk
    Then the booking should be successful

  Scenario: User without active membership cannot book a desk
    Given the user does not have an active office membership
    When the user attempts to book a desk
    Then the booking should be denied
    And an error message should be displayed indicating lack of membership

  Scenario: User with access permissions can book a desk
    Given the user has access permissions
    When the user attempts to book a desk
    Then the booking should be successful

  Scenario: User without access permissions cannot book a desk
    Given the user does not have access permissions
    When the user attempts to book a desk
    Then the booking should be denied
    And an error message should be displayed indicating lack of permissions