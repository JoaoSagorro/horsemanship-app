class UserAula < ApplicationRecord
  belongs_to :user
  belongs_to :aula
end
