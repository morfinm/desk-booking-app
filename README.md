# Desk Booking Test Automation Framework

This repository contains the test automation framework for the Desk Booking application. The framework is built using Java, Cucumber, Selenium 4, and TestNG, following the Page Object Model design pattern.

## Framework Structure

```
/DeskBookingFramework
│
├── /src
│   ├── /main
│   │   ├── /java
│   │   │   ├── /com
│   │   │   │   ├── /deskbooking
│   │   │   │       ├── /base
│   │   │   │       ├── /pages
│   │   │   │       ├── /utils
│   │   │   │       ├── /constants
│   │   │   │       ├── /enums
│   │   │   │       ├── /factory
│   │   │   │       ├── /exceptions
│   │   │   │       ├── /annotations
│   ├── /test
│       ├── /java
│       │   ├── /com
│       │   │   ├── /deskbooking
│       │   │       ├── /stepdefinitions
│       │   │       ├── /runners
│       │   │       ├── /hooks
│       ├── /resources
│           ├── /features
│           ├── /testdata
│           ├── /config
├── /logs
├── /reports
├── pom.xml
├── README.md
```

## About the Framework

The Desk Booking Test Automation Framework is designed to provide a robust and scalable solution for automating tests of the Desk Booking application. Key features include:

- Java-based automation using Selenium 4
- BDD approach with Cucumber
- TestNG for test execution and reporting
- Page Object Model design pattern for better maintainability
- Configurable test data and environments
- Detailed logging and reporting

## Setup Instructions

1. Clone this repository
2. Ensure you have Java JDK 11 or higher installed
3. Install Maven
4. Run `mvn clean install` to download dependencies

## Running Tests

To run the tests, use the following command:

```
mvn test
```

You can also run specific test suites or features by using TestNG XML files or Cucumber tags. For example:

```
mvn test -Dcucumber.options="--tags @smoke"
```

## Configuration

The framework supports multiple environments and configurations. You can specify the environment to run tests against by modifying the `config.properties` file in the `/src/test/resources/config` directory.

## Test Data Management

Test data is managed through Excel files and JSON files located in the `/src/test/resources/testdata` directory. This allows for easy modification and management of test data without changing the code.

## Reporting

After test execution, you can find the test reports in the `/reports` directory. The framework generates the following types of reports:

- Cucumber HTML reports
- TestNG HTML reports
- Extent reports for detailed test execution logs and screenshots

To view the reports, open the respective HTML files in a web browser.

## Logging

Detailed logs of test execution are stored in the `/logs` directory. These logs can be useful for debugging and analyzing test failures.

## Best Practices

When contributing to this framework, please follow these best practices:

- Write clean, readable, and well-documented code
- Follow the Page Object Model pattern for new page classes
- Use meaningful names for methods, variables, and classes
- Write reusable and parameterized step definitions
- Keep feature files simple and focused on business scenarios
- Regularly update dependencies and address any security vulnerabilities

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests.

## Support

For any questions or issues related to this framework, please create an issue in the repository or contact the maintainers.