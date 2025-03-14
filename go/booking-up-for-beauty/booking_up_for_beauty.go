package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	layout := "1/2/2006 15:04:05"
	t, _ := time.Parse(layout, date)
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	layout := "January 2, 2006 15:04:05"
	t, _ := time.Parse(layout, date)
	return time.Now().After(t)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	layout := "Monday, January 2, 2006 15:04:05"
	t, _ := time.Parse(layout, date)
	hour := t.Hour()

	return hour >= 12 && hour < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	layout := "1/2/2006 15:04:05"
	t, _ := time.Parse(layout, date)
	formatted := t.Format("Monday, January 2, 2006, at 15:04")
	return "You have an appointment on " + formatted + "."
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	// return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
	t, _ := time.Parse("2006-01-02", fmt.Sprintf("%d-09-15", time.Now().Year()))
	return t
}
