class Vndb::Company < ApplicationRecord
  has_many :games, through: :publishers
  has_many :publishers

  belongs_to :country, class_name: 'General::Country'
end
