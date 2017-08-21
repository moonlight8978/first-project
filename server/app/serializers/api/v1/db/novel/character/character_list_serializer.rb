class Api::V1::Db::Novel::Character::CharacterListSerializer < ActiveModel::Serializer
  unknown = '不明'
  
  has_many :novels, serializer: Api::V1::Db::Novel::Character::NovelSerializer

  attributes :id, :name, :name_en, :weight, :height, :blood_type, :birthday_day,
    :birthday_month, :bust, :waist, :hips, :image, :gender, :role
end
