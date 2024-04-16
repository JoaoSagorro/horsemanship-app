class Aula < ApplicationRecord
  has_many :user_aulas
  has_many :users, through: :user_aulas
  has_many :bookings, dependent: :destroy

  CLASS_TYPES = ["Aula de obstáculos", "Ensino - Sela 1", "Ensino - Sela 2", "Volteio"]
  validates :title, presence: true
  validates :class_type, presence: true, inclusion: { in: CLASS_TYPES }
  validates :occurs_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :spots, presence: true
  validate :end_time_after_start_time?
  validates :teacher, presence: true

  private

  def end_time_after_start_time?
    if end_time < start_time
      errors.add :end_time, "Tem que ser após data inicial"
    end
  end
end
