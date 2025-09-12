package com.deskbooking.base;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;
import com.deskbooking.utils.WaitUtils;

public class BasePage {
    protected WebDriver driver;
    protected WaitUtils waitUtils;

    public BasePage(WebDriver driver) {
        this.driver = driver;
        this.waitUtils = new WaitUtils(driver);
        PageFactory.initElements(driver, this);
    }
}