class User < ApplicationRecord
  has_many :authorities
  has_many :roles, through: :authorities
  has_many :reset_password_token

  has_secure_password

  def token
    JsonWebToken.encode({ id: self.id })
  end

  def roles
    Role.joins(:authorities).where('authorities.user_id' => self.id).pluck(:role)
  end
end
