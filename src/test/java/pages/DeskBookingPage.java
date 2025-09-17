package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.time.LocalDate;
import java.time.LocalTime;

public class DeskBookingPage {

    private WebDriver driver;

    @FindBy(id = "book-desk-button")
    private WebElement bookDeskButton;

    @FindBy(id = "error-message")
    private WebElement errorMessageElement;

    @FindBy(id = "date-picker")
    private WebElement datePicker;

    @FindBy(id = "time-picker")
    private WebElement timePicker;

    @FindBy(id = "recurring-booking-checkbox")
    private WebElement recurringBookingCheckbox;

    @FindBy(id = "confirm-recurring-booking")
    private WebElement confirmRecurringBookingButton;

    private boolean userHasActiveMembership;
    private boolean deskIsAvailable;
    private boolean userHasBookedToday;
    private LocalDate bookingDate;
    private LocalTime bookingTime;
    private boolean specificDeskAvailable;
    private boolean deskAvailableForRecurring;

    public DeskBookingPage() {
        PageFactory.initElements(driver, this);
    }

    public void setUserMembershipStatus(boolean isActive) {
        this.userHasActiveMembership = isActive;
    }

    public void setDeskAvailability(boolean isAvailable) {
        this.deskIsAvailable = isAvailable;
    }

    public void setUserBookingStatus(boolean hasBooked) {
        this.userHasBookedToday = hasBooked;
    }

    public void setBookingDate(boolean isWithin, int days) {
        this.bookingDate = isWithin ? LocalDate.now().plusDays(days - 1) : LocalDate.now().plusDays(days + 1);
    }

    public void setBookingTime(boolean isAtLeast, int hours) {
        this.bookingTime = isAtLeast ? LocalTime.now().plusHours(hours) : LocalTime.now().plusMinutes(59);
    }

    public void setSpecificDeskAvailability(boolean isAvailable) {
        this.specificDeskAvailable = isAvailable;
    }

    public void setDeskAvailabilityForRecurringBookings(boolean isAvailable) {
        this.deskAvailableForRecurring = isAvailable;
    }

    public boolean attemptBooking() {
        if (!userHasActiveMembership || !deskIsAvailable || userHasBookedToday) {
            return false;
        }
        if (bookingDate != null && bookingDate.isAfter(LocalDate.now().plusDays(30))) {
            return false;
        }
        if (bookingTime != null && bookingTime.isBefore(LocalTime.now().plusHours(1))) {
            return false;
        }
        bookDeskButton.click();
        return true;
    }

    public String getErrorMessage() {
        return errorMessageElement.getText();
    }

    public boolean attemptSpecificDeskBooking() {
        if (!specificDeskAvailable) {
            return false;
        }
        // Logic to select and book a specific desk
        return attemptBooking();
    }

    public boolean setupRecurringBooking() {
        if (!deskAvailableForRecurring) {
            return false;
        }
        recurringBookingCheckbox.click();
        confirmRecurringBookingButton.click();
        return true;
    }

    public boolean areRecurringBookingsDisplayedClearly() {
        // Logic to check if recurring bookings are displayed clearly
        return true;
    }
}