class Db::Person < ApplicationRecord
  validates :name, :name_en,
    presence: true
  validates :gender,
    presence: true,
    inclusion: { in: %w(male female) }
  validates :birthday_day,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 32 }
  validates :birthday_month,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 13 }
  validates :birthday_year,
    allow_nil: true,
    numericality: { only_integer: true, greater_than: 0, less_than: Time.zone.today.year }
  validate :birthday_cannot_be_in_the_future,
    if: -> { self.birthday_year && self.birthday_month && self.birthday_day }
  validates :link,
    if: -> { self.link },
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :twitter,
    if: -> { self.twitter },
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :twitter,
    if: -> { self.twitter },
    format: { with: /[twitter.com|mobile.twitter.com|m.twitter.com]/,
              message: 'Must be Twitter page!' }

  enum gender: [:female, :male]

  belongs_to :country, class_name: 'Country', optional: true

  has_many :voice_actresses, dependent: :destroy,
    class_name: 'Db::Novel::Character::VoiceActress'
  has_many :staffs,          dependent: :destroy,
    class_name: 'Db::Novel::Staff'

  has_many :character_novels, class_name: 'Db::Novel::CharacterNovel', through: :voice_actresses
  has_many :novels,                                                    through: :staffs

  searchable do
    text :name_en
    text :name do
      NetworkKanjiFilter.to_hiragana(name)
    end
    text :twitter do
      twitter ? gsub_twitter : ''
    end
  end

private

  def birthday_cannot_be_in_the_future
    birthday = Date.new(self.birthday_year, self.birthday_month, self.birthday_day)
    # Date.today ~ Time.zone.today
    if birthday >= Date.today
      errors.add(:birthday, 'Birthday cannot be in the future!')
    end
  end

  def gsub_twitter
    twitter.gsub(/((https|http)\:\/\/|twitter.com\/|m.twitter.com\/|mobile.twitter.com\/)/i, '')
  end
end
