class Db::Novel::Character < ApplicationRecord
  enum role: [:protagonist, :main, :side]

  has_many :voice_actresses, class_name: 'Db::Novel::Character::VoiceActress'

  has_many :people, class_name: 'Db::Person', through: :voice_actresses
  has_many :novels,                           through: :voice_actresses

  has_many :comments, class_name: 'Feature::Comment', as: :commentable
  has_many :ratings,  class_name: 'Feature::Rating',  as: :rateable

private

  def three_sizes
    "#{self.bust}-#{self.waist}-#{self.hip}cm"
  end
end
