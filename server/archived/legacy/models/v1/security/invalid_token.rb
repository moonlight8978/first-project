class Security::InvalidToken < ApplicationRecord
  scope :expired, -> { where('expiration <= ?', Time.zone.now) }
end
