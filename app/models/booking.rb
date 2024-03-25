class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :aula

  validates :attendees, presence: true, numericality: { greater_than: 0 }
  # validates: :max_number_of_attendees

  # private
  # def max_number_of_attendees
    # the number of attendees is not allowed to exceed the number of available spots
    # if (self.aulas.spots - self.aulas.bookings.count) < self.attendees
      # errors.add(:attendees, "cannot exceed number of available spots")
    # end
  # end
end
