class Security::User < ApplicationRecord
  belongs_to :country, class_name: 'Country', optional: true

  has_and_belongs_to_many :roles,
    join_table: :security_roles_users

  has_many :reset_password_tokens
  has_many :activate_account_tokens

  has_many :comments, class_name: 'Feature::Comment'

  has_secure_password

  def token
    JsonWebToken.encode({ id: self.id })
  end
end
