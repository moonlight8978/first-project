class Db::Novel::Character < ApplicationRecord
  before_save :standardized

  validates :name, :name_en,
    presence: true
  validates :birthday_day,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 32 }
  validates :birthday_month,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 13 }
  validates :bust, :hip, :waist,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :gender,
    presence: true,
    inclusion: { in: %w(male female) }
  validates :weight, :height,
    allow_nil: true,
    numericality: { greater_than: 0 }
  validates :blood_type,
    allow_nil: true,
    inclusion: { in: %w(a b ab o) }
  validates :image,
    allow_nil: true,
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :image,
    allow_nil: true,
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: 'Image must be one of following type: .jpg, .png or .jpeg' }
  validates :role,
    presence: true,
    inclusion: { in: %w(protagonist main side) }


  attr_accessor :voice_actresses_in_novel

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

  def standardized
    self.blood_type.upcase!
  end
end
