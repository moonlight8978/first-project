class CdProductRef < ApplicationRecord
  has_one :cd
  belongs_to :product
end
