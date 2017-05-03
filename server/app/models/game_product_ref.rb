class GameProductRef < ApplicationRecord
  belongs_to :product
  has_one :game
end
