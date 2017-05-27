class Game < ApplicationRecord
  belongs_to :product

  has_many :companies, through: :publishers
  has_many :publishers
end
