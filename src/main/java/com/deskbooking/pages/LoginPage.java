package com.deskbooking.pages;

import com.deskbooking.base.BasePage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class LoginPage extends BasePage {

    @FindBy(id = "username")
    private WebElement usernameInput;

    @FindBy(id = "password")
    private WebElement passwordInput;

    @FindBy(id = "login-button")
    private WebElement loginButton;

    public LoginPage(WebDriver driver) {
        super(driver);
    }

    public void enterUsername(String username) {
        waitUtils.waitForElementToBeVisible(usernameInput);
        usernameInput.sendKeys(username);
    }

    public void enterPassword(String password) {
        waitUtils.waitForElementToBeVisible(passwordInput);
        passwordInput.sendKeys(password);
    }

    public void clickLoginButton() {
        waitUtils.waitForElementToBeClickable(loginButton);
        loginButton.click();
    }

    public void login(String username, String password) {
        enterUsername(username);
        enterPassword(password);
        clickLoginButton();
    }
}