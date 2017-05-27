class Publisher < ApplicationRecord
  has_many :games, through: :publishers
  has_many :publishers
end
