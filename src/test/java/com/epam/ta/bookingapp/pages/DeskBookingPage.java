package com.epam.ta.bookingapp.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.time.LocalDate;
import java.util.List;

public class DeskBookingPage extends BasePage {

    @FindBy(id = "desk-list")
    private WebElement deskList;

    @FindBy(id = "book-button")
    private WebElement bookButton;

    @FindBy(id = "error-message")
    private WebElement errorMessage;

    @FindBy(id = "date-picker")
    private WebElement datePicker;

    @FindBy(id = "filter-dropdown")
    private WebElement filterDropdown;

    @FindBy(id = "recurring-checkbox")
    private WebElement recurringCheckbox;

    public DeskBookingPage(WebDriver driver) {
        super(driver);
    }

    public void selectDesk(String deskId) {
        WebElement desk = wait.until(ExpectedConditions.elementToBeClickable(By.id(deskId)));
        desk.click();
    }

    public void confirmBooking() {
        wait.until(ExpectedConditions.elementToBeClickable(bookButton)).click();
    }

    public String getErrorMessage() {
        return wait.until(ExpectedConditions.visibilityOf(errorMessage)).getText();
    }

    public void selectDate(LocalDate date) {
        // Implement date selection logic
    }

    public void filterDesks(String filterType) {
        wait.until(ExpectedConditions.elementToBeClickable(filterDropdown)).click();
        driver.findElement(By.xpath("//li[text()='" + filterType + "']")).click();
    }

    public void setRecurringBooking(List<String> days, int weeks) {
        recurringCheckbox.click();
        // Implement recurring booking setup logic
    }

    public boolean isDeskAvailable(String deskId) {
        WebElement desk = driver.findElement(By.id(deskId));
        return desk.getAttribute("class").contains("available");
    }
}