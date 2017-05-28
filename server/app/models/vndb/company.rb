class Vndb::Company < ApplicationRecord
  has_many :games, through: :publishes
  has_many :publishes
end
