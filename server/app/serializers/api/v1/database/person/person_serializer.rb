class Api::V1::Database::Person::PersonSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :gender, :birthday, :link, :twitter, :country_name,
    :country_name_en

  def birthday
    "#{object.birthday_year || UNKNOWN}年"\
    "#{object.birthday_month || UNKNOWN}月"\
    "#{object.birthday_day || UNKNOWN}日"
  end

  def country_name
    (object.country && object.country.name) || UNKNOWN
  end

  def country_name_en
    (object.country && object.country.name_en) || UNKNOWN
  end
end
