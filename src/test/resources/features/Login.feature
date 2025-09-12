Feature: Login Functionality

  Scenario: Successful login with valid credentials
    Given the user is on the login page
    When the user enters valid username "validuser@example.com"
    And the user enters valid password "validpassword123"
    And the user clicks the login button
    Then the user should be logged in successfully

  Scenario: Failed login with invalid credentials
    Given the user is on the login page
    When the user enters invalid username "invaliduser@example.com"
    And the user enters invalid password "invalidpassword123"
    And the user clicks the login button
    Then the user should see an error message