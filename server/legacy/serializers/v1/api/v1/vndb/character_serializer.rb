class Api::V1::Vndb::CharacterSerializer < ActiveModel::Serializer
  attributes :id, :novel_id, :name, :name_en, :weight, :height, :blood_type,
    :three_sizes, :birthday, :image, :gender, :description, :description_en, :role

  def three_sizes
    "#{object.bust}-#{object.waist}-#{object.hip}"
  end

  def birthday
    "#{object.birthday_month}月#{object.birthday_day}日"
  end
end
