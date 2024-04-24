class User < ApplicationRecord
  has_many :user_aulas
  has_many :aulas, through: :user_aulas
  has_many :bookings
  has_one :aluno_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, invite_for: 2.weeks

  enum role: [:aluno, :professor, :admin]

  after_initialize :set_default_role, :if => :new_record?
  after_create :create_aluno_profile, if: :aluno?

  def set_default_role
    self.role ||= :user
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def create_aluno_profile
    self.create.aluno_profile unless self.aluno_profile
  end
end
