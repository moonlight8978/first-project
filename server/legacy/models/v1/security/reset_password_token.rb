class Security::ResetPasswordToken < ApplicationRecord
  belongs_to :user
end
