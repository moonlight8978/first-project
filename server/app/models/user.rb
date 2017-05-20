class User < ApplicationRecord
  has_secure_password

  has_many :authorities
  has_many :roles, through: :authorities

  # def as_json(options = {})
  #   super(options.merge({ include: :roles }))
  # end

  def token
    JsonWebToken.encode({ id: self.id })
  end

  def roles
    Role.joins(:authorities).where('authorities.user_id' => self.id).pluck(:role)
  end
end
