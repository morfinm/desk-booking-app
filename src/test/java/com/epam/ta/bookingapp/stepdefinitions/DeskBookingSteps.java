package com.epam.ta.bookingapp.stepdefinitions;

import com.epam.ta.bookingapp.pages.DeskBookingPage;
import com.epam.ta.bookingapp.utils.UserSession;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.testng.Assert;

import java.time.LocalDate;
import java.util.List;

public class DeskBookingSteps {

    private WebDriver driver; // Initialize this in a @Before hook
    private DeskBookingPage deskBookingPage;
    private UserSession userSession;

    public DeskBookingSteps() {
        // Initialize driver, deskBookingPage, and userSession
        this.deskBookingPage = new DeskBookingPage(driver);
        this.userSession = new UserSession();
    }

    @Given("the user is on the desk booking page")
    public void userIsOnDeskBookingPage() {
        // Navigate to the desk booking page
    }

    @Given("the user has an active office membership")
    public void userHasActiveMembership() {
        userSession.setActiveMembership(true);
    }

    @Given("the user does not have an active office membership")
    public void userDoesNotHaveActiveMembership() {
        userSession.setActiveMembership(false);
    }

    @Given("the user has access permissions")
    public void userHasAccessPermissions() {
        userSession.setAccessPermissions(true);
    }

    @Given("the user does not have access permissions")
    public void userDoesNotHaveAccessPermissions() {
        userSession.setAccessPermissions(false);
    }

    @When("the user attempts to book a desk")
    public void userAttemptsToBookDesk() {
        deskBookingPage.selectDesk("desk-1");
        deskBookingPage.confirmBooking();
    }

    @Then("the booking should be successful")
    public void bookingShouldBeSuccessful() {
        // Assert that the booking was successful
    }

    @Then("the booking should be denied")
    public void bookingShouldBeDenied() {
        // Assert that the booking was denied
    }

    @Then("an error message should be displayed indicating lack of membership")
    public void errorMessageDisplayedLackOfMembership() {
        String errorMessage = deskBookingPage.getErrorMessage();
        Assert.assertTrue(errorMessage.contains("active membership required"));
    }

    @Then("an error message should be displayed indicating lack of permissions")
    public void errorMessageDisplayedLackOfPermissions() {
        String errorMessage = deskBookingPage.getErrorMessage();
        Assert.assertTrue(errorMessage.contains("access permissions required"));
    }

    @When("the user selects an available desk for a single day")
    public void userSelectsAvailableDeskForSingleDay() {
        deskBookingPage.selectDesk("available-desk");
        deskBookingPage.selectDate(LocalDate.now());
    }

    @When("the user selects an available desk for {int} consecutive days")
    public void userSelectsAvailableDeskForConsecutiveDays(int days) {
        deskBookingPage.selectDesk("available-desk");
        LocalDate startDate = LocalDate.now();
        for (int i = 0; i < days; i++) {
            deskBookingPage.selectDate(startDate.plusDays(i));
        }
    }

    @When("the user selects a desk that is not available")
    public void userSelectsUnavailableDesk() {
        deskBookingPage.selectDesk("unavailable-desk");
    }

    @Then("the system should not allow the booking")
    public void systemShouldNotAllowBooking() {
        // Assert that the booking was not allowed
    }

    @Given("the user's team has a limit of {int} bookings per week")
    public void userTeamHasBookingLimit(int limit) {
        // Set the team booking limit
    }

    @When("the user books {int} desks for different days in the same week")
    public void userBooksDesksForDifferentDays(int count) {
        for (int i = 0; i < count; i++) {
            deskBookingPage.selectDesk("desk-" + i);
            deskBookingPage.selectDate(LocalDate.now().plusDays(i));
            deskBookingPage.confirmBooking();
            userSession.incrementBookingsThisWeek();
        }
    }

    @When("the user attempts to book another desk for this week")
    public void userAttemptsToBookAnotherDesk() {
        deskBookingPage.selectDesk("extra-desk");
        deskBookingPage.selectDate(LocalDate.now().plusDays(userSession.getBookingsThisWeek()));
        deskBookingPage.confirmBooking();
    }

    @When("the user sets up a recurring booking for every {word} for the next {int} weeks")
    public void userSetsUpRecurringBooking(String day, int weeks) {
        deskBookingPage.setRecurringBooking(List.of(day), weeks);
    }

    @When("all selected dates are available")
    public void allSelectedDatesAreAvailable() {
        // Implement logic to check if all selected dates are available
    }

    @When("one of the {word}s is not available")
    public void oneDateIsNotAvailable(String day) {
        // Implement logic to make one of the dates unavailable
    }

    // Add more step definitions as needed
}