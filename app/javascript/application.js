// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("DOMContentLoaded", function() {
  const buttons = document.querySelectorAll('.book-class-button');

  buttons.forEach(button => {
    button.addEventListener('click', function() {
      const aulaId = this.dataset.aulaId;
      let attendeesCount = parseInt(this.dataset.attendeesCount);
      let bookingStatus = this.dataset.bookingStatus === 'booked' ? true : false;

      if (bookingStatus) {
        attendeesCount--; // Decrease attendees count if canceling booking
      } else {
        attendeesCount++; // Increase attendees count if booking class
      }

      // Update data attributes
      this.dataset.attendeesCount = attendeesCount;
      this.dataset.bookingStatus = bookingStatus ? 'not-booked' : 'booked';

      // Update button text
      this.textContent = bookingStatus ? 'Book Class' : 'Cancel Booking';

      // Update hidden fields
      const form = document.createElement('form');
      form.method = 'POST';
      form.action = '/aulas/' + aulaId + '/bookings';
      form.innerHTML = `
        <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
        <input type="hidden" name="booking[attendees]" value="${attendeesCount}">
        <input type="hidden" name="booking[status]" value="${bookingStatus}">
      `;

      document.body.appendChild(form);
      form.submit();
    });
  });
})
