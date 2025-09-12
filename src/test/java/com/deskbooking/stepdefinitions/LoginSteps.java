package com.deskbooking.stepdefinitions;

import com.deskbooking.pages.LoginPage;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

public class LoginSteps {
    private WebDriver driver;
    private LoginPage loginPage;

    public LoginSteps() {
        // Initialize WebDriver here or inject it using dependency injection
        this.driver = // Initialize your WebDriver
        this.loginPage = new LoginPage(driver);
    }

    @Given("the user is on the login page")
    public void theUserIsOnTheLoginPage() {
        driver.get("http://your-app-url.com/login");
    }

    @When("the user enters valid username {string}")
    public void theUserEntersValidUsername(String username) {
        loginPage.enterUsername(username);
    }

    @When("the user enters valid password {string}")
    public void theUserEntersValidPassword(String password) {
        loginPage.enterPassword(password);
    }

    @When("the user clicks the login button")
    public void theUserClicksTheLoginButton() {
        loginPage.clickLoginButton();
    }

    @Then("the user should be logged in successfully")
    public void theUserShouldBeLoggedInSuccessfully() {
        // Add assertion to verify successful login
        Assert.assertTrue(driver.getCurrentUrl().contains("/dashboard"), "Login was not successful");
    }

    @When("the user enters invalid username {string}")
    public void theUserEntersInvalidUsername(String username) {
        loginPage.enterUsername(username);
    }

    @When("the user enters invalid password {string}")
    public void theUserEntersInvalidPassword(String password) {
        loginPage.enterPassword(password);
    }

    @Then("the user should see an error message")
    public void theUserShouldSeeAnErrorMessage() {
        // Add assertion to verify error message is displayed
        Assert.assertTrue(loginPage.isErrorMessageDisplayed(), "Error message was not displayed");
    }
}