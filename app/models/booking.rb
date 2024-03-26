class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :aula

  validates :attendees, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :max_number_of_attendees

  private

  def max_number_of_attendees
    # the number of attendees is not allowed to exceed the number of available spots
    if (self.aula.spots - self.aula.bookings.count) < self.attendees
      errors.add(:attendees, "cannot exceed number of available spots")
    end
  end
end
