class Security::User::ActivateAccountToken < ApplicationRecord
  validates :token, uniqueness: true

  belongs_to :user
end
