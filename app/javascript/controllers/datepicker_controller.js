import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: false,
      dateFormat: "Y-m-d"
    })
  }

  // Initialize date picker
  chooseDate() {
    flatpickr(this.element, {
      enableTime: false,
      dateFormat: "Y-m-d", // Set date format
      onClose: (selectedDates, dateStr, instance) => {
        // Convert selected date string to Date object
        const selectedDate = new Date(dateStr);
        // Get the month of the selected date (0-indexed)
        const selectedMonth = selectedDate.getMonth() + 1;
        // Get the year of the selected date
        const selectedYear = selectedDate.getFullYear();

        // Construct URL with selected date
        const url = `/aulas?year=${selectedYear}&month=${selectedMonth}`;

        // Redirect to the page with the selected date
        window.location.href = url;
      }
    });
  }
}
