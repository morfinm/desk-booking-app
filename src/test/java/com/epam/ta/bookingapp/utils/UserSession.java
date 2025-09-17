package com.epam.ta.bookingapp.utils;

public class UserSession {
    private boolean activeMembership;
    private boolean accessPermissions;
    private int bookingsThisWeek;

    public UserSession() {
        this.activeMembership = false;
        this.accessPermissions = false;
        this.bookingsThisWeek = 0;
    }

    public void setActiveMembership(boolean activeMembership) {
        this.activeMembership = activeMembership;
    }

    public void setAccessPermissions(boolean accessPermissions) {
        this.accessPermissions = accessPermissions;
    }

    public boolean hasActiveMembership() {
        return activeMembership;
    }

    public boolean hasAccessPermissions() {
        return accessPermissions;
    }

    public void incrementBookingsThisWeek() {
        bookingsThisWeek++;
    }

    public int getBookingsThisWeek() {
        return bookingsThisWeek;
    }

    public void resetBookingsThisWeek() {
        bookingsThisWeek = 0;
    }
}