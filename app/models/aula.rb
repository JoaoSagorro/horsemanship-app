class Aula < ApplicationRecord
  validates :title, presence: true
  validates :class_type, presence: true
  validates :occurs_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
