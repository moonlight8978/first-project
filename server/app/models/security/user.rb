class User < ApplicationRecord
  has_many :authorities
  has_many :roles, through: :authorities
    alias_method :original_roles, :roles
  has_many :reset_password_tokens

  has_secure_password

  def token
    JsonWebToken.encode({ id: self.id })
  end

  def roles
    self.original_roles.map { |e| e.role }
  end
end
