class Api::V1::Db::Novel::Character::CharacterListSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type,
    :bust, :waist, :hips, :three_sizes, :birthday, :image, :gender, :role

  def birthday
    "#{object.birthday_month || unknown}月#{object.birthday_day || unknown}日"
  end
end
