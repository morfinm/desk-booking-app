package stepdefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import org.junit.Assert;
import pages.DeskBookingPage;

public class BookingRulesSteps {

    private DeskBookingPage deskBookingPage;
    private boolean bookingResult;
    private String errorMessage;

    public BookingRulesSteps() {
        deskBookingPage = new DeskBookingPage();
    }

    @Given("the user is logged into the desk booking system")
    public void userIsLoggedIn() {
        // Implement login logic
    }

    @Given("the user has an active office membership")
    public void userHasActiveMembership() {
        deskBookingPage.setUserMembershipStatus(true);
    }

    @Given("the user does not have an active office membership")
    public void userDoesNotHaveActiveMembership() {
        deskBookingPage.setUserMembershipStatus(false);
    }

    @When("the user attempts to book a desk")
    public void userAttemptsToBookDesk() {
        bookingResult = deskBookingPage.attemptBooking();
    }

    @Then("the booking should be successful")
    public void bookingShouldBeSuccessful() {
        Assert.assertTrue("Booking should be successful", bookingResult);
    }

    @Then("the booking should be prevented")
    public void bookingShouldBePrevented() {
        Assert.assertFalse("Booking should be prevented", bookingResult);
    }

    @Then("an appropriate error message should be displayed")
    public void appropriateErrorMessageShouldBeDisplayed() {
        errorMessage = deskBookingPage.getErrorMessage();
        Assert.assertNotNull("Error message should not be null", errorMessage);
        Assert.assertFalse("Error message should not be empty", errorMessage.isEmpty());
    }

    @Given("a desk is (available|unavailable) for a specific time slot")
    public void deskAvailabilityForTimeSlot(String availability) {
        boolean isAvailable = "available".equals(availability);
        deskBookingPage.setDeskAvailability(isAvailable);
    }

    @Given("the user has (not booked|already booked) a desk for the day")
    public void userDeskBookingStatus(String bookingStatus) {
        boolean hasBooked = "already booked".equals(bookingStatus);
        deskBookingPage.setUserBookingStatus(hasBooked);
    }

    @Given("the booking date is (within|more than) {int} days from today")
    public void setBookingDate(String withinOrMore, int days) {
        boolean isWithin = "within".equals(withinOrMore);
        deskBookingPage.setBookingDate(isWithin, days);
    }

    @Given("the booking time is (at least|less than) {int} hour from now")
    public void setBookingTime(String atLeastOrLess, int hours) {
        boolean isAtLeast = "at least".equals(atLeastOrLess);
        deskBookingPage.setBookingTime(isAtLeast, hours);
    }

    @Given("a specific desk is available")
    public void specificDeskIsAvailable() {
        deskBookingPage.setSpecificDeskAvailability(true);
    }

    @When("the user attempts to select and book the desk")
    public void userAttemptsToSelectAndBookDesk() {
        bookingResult = deskBookingPage.attemptSpecificDeskBooking();
    }

    @Given("a desk is available for recurring bookings")
    public void deskAvailableForRecurringBookings() {
        deskBookingPage.setDeskAvailabilityForRecurringBookings(true);
    }

    @When("the user sets up a recurring booking")
    public void userSetsUpRecurringBooking() {
        bookingResult = deskBookingPage.setupRecurringBooking();
    }

    @Then("the recurring booking should be confirmed")
    public void recurringBookingShouldBeConfirmed() {
        Assert.assertTrue("Recurring booking should be confirmed", bookingResult);
    }

    @Then("all recurring bookings should be displayed clearly when viewing bookings")
    public void allRecurringBookingsShouldBeDisplayedClearly() {
        Assert.assertTrue("Recurring bookings should be displayed clearly", deskBookingPage.areRecurringBookingsDisplayedClearly());
    }
}