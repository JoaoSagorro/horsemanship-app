class Aula < ApplicationRecord
  has_many :user_aulas
  has_many :users, through: :user_aulas
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :class_type, presence: true
  validates :occurs_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :spots, presence: true
  validate :end_time_after_start_time?

  private

  def end_time_after_start_time?
    if end_time < start_time
      errors.add :end_time, "must be after start date"
    end
  end
end
