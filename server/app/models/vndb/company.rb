class Vndb::Company < ApplicationRecord
  belongs_to :country, class_name: 'General::Country', optional: true

  has_many :publishers
  has_many :releases, through: :publishers
  # class_name: 'Release'

  # has_many :developers
  # has_many :released, class_name: 'Release', through: :developers
end
