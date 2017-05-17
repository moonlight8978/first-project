class User < ApplicationRecord
  has_secure_password

  has_many :authorities
  has_many :roles, through: :authorities

  # def as_json(options = {})
  #   super(options.merge({ include: :roles }))
  # end
  
end
