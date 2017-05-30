class Vndb::Person < ApplicationRecord
  belongs_to :country, class_name: 'General::Country', optional: true

  has_many :voice_actresses
  has_many :characters, through: :voice_actresses

  has_many :staffs
  has_many :novels, through: :staffs
end
