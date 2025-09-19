Feature: Booking Eligibility Restriction

  As an employee with active office access
  I want to book a desk only if I am an active employee or have office access permission
  So that only authorized personnel can reserve desks in the office

  Background:
    Given the desk booking system is operational

  Scenario: Active employee successfully books a desk
    Given I am logged in as an active employee
    When I attempt to book a desk
    Then the booking should be processed successfully

  Scenario: Employee with office access permission books a desk
    Given I am logged in as an employee with office access permission
    When I attempt to book a desk
    Then the booking should be processed successfully

  Scenario: Inactive employee attempts to book a desk
    Given I am logged in as an inactive employee
    When I attempt to book a desk
    Then the booking should be denied
    And I should see an informative message about booking eligibility

  Scenario: Employee without office access permission attempts to book a desk
    Given I am logged in as an employee without office access permission
    When I attempt to book a desk
    Then the booking should be denied
    And I should see an informative message about booking eligibility

  Scenario: System handles high volume of concurrent booking eligibility checks
    Given there are 1000 concurrent users attempting to book desks
    When the system processes all booking attempts simultaneously
    Then all eligibility checks should be completed within the expected time frame
    And the system should maintain accuracy in determining eligibility