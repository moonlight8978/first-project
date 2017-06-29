class Database::Person < ApplicationRecord
  belongs_to :country, class_name: 'General::Country', optional: true

  has_many :voice_actresses, class_name: 'Vndb::VoiceActress'
  has_many :staffs,          class_name: 'Vndb::Staff'

  has_many :characters, class_name: 'Vndb::Character', through: :voice_actresses
  has_many :novels,     class_name: 'Vndb::Novel',     through: :staffs
end
