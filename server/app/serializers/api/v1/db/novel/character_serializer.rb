class Api::V1::Db::Novel::CharacterSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type,
    :three_sizes, :birthday_month, :birthday_day, :image, :gender, :description,
    :description_en, :role

  has_many :voice_actresses_in_novel, key: :voice_actresses, serializer: Api::V1::Db::Novel::Character::VoiceActressSerializer

  def three_sizes
    "#{object.bust}-#{object.waist}-#{object.hip}"
  end
end
