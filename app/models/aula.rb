class Aula < ApplicationRecord
  has_many :user_aulas
  has_many :users, through: :user_aulas

  validates :title, presence: true
  validates :class_type, presence: true
  validates :occurs_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
