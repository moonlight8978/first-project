class Db::Novel::Character < ApplicationRecord
  include Commentable
  
  before_save :standardized

  validates :name, :name_en,
    presence: true
  validates :birthday_day,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 32 }
  validates :birthday_month,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 13 }
  validates :bust, :hips, :waist,
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
    inclusion: { in: %w(a A b B ab AB o O) }
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
  enum gender: [:female, :male]

  has_many :character_novels

  has_many :novels, through: :character_novels

  has_many :comments, class_name: 'Feature::Comment', as: :commentable
  has_many :ratings,  class_name: 'Feature::Rating',  as: :rateable

  def voice_actresses_in(novel_id)
    self.voice_actresses.select { |voice_actress| voice_actress.novel_id == novel_id }
  end

private

  def standardized
    self.blood_type && self.blood_type.upcase!
  end
end
