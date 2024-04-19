class User < ApplicationRecord
  has_many :user_aulas
  has_many :aulas, through: :user_aulas
  has_many :bookings
  has_one :aluno_profile
  has_many :models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, invite_for: 2.weeks

  # enum role: [:aluno, :professor, :admin]
  enum role: { aluno: 0, professor: 1, admin: 2 }

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
