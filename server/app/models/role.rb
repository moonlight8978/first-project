class Role < ApplicationRecord
  has_many :authorities
  has_many :users, through: :authorities
end
