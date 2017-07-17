class Api::V1::Db::Novel::Character::CharacterDetailSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type, :birthday_day,
    :birthday_month, :bust, :waist, :hips, :image, :gender, :role,
    :description, :description_en

  has_many :character_novels, key: :novels
end
