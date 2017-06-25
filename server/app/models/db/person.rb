class Db::Person < ApplicationRecord
  belongs_to :country, class_name: 'Country', optional: true

  has_many :voice_actresses, class_name: 'Db::Novel::Character::VoiceActress'
  has_many :staffs,          class_name: 'Db::Novel::Staff'

  has_many :characters, class_name: 'Db::Novel::Character', through: :voice_actresses
  has_many :novels,                                         through: :staffs
end
