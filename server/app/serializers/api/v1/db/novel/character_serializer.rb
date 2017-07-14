class Api::V1::Db::Novel::CharacterSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type,
    :birthday_month, :birthday_day, :image, :gender, :description,
    :description_en, :role

end
