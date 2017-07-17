class Api::V1::Db::Novel::Character::CharacterListSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type, :birthday_day,
    :birthday_month, :bust, :waist, :hips, :three_sizes, :birthday, :image,
    :gender, :role
end
