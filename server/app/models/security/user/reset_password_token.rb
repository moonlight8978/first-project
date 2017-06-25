class Security::User::ResetPasswordToken < ApplicationRecord
  belongs_to :user
end
