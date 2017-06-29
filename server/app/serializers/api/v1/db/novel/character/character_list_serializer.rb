class Api::V1::Db::Novel::Character::CharacterListSerializer < ActiveModel::Serializer
  unknown = '不明'

  attributes :id, :name, :name_en, :weight, :height, :blood_type,
    :three_sizes, :birthday, :image, :gender, :role

  def three_sizes
    "#{object.bust}-#{object.waist}-#{object.hip}"
  end

  def birthday
    "#{object.birthday_month || unknown}月#{object.birthday_day || unknown}日"
  end
end
