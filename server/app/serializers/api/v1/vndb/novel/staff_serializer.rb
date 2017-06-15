class Api::V1::Vndb::Novel::StaffSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :note, :position, :alias, :alias_en

  attribute :id do
    object.person.id
  end

  attribute :name do
    object.person.name
  end

  attribute :name_en do
    object.person.name_en
  end

  attribute :country_name do
    (object.person.country && object.person.country.name) || UNKNOWN
  end

  attribute :country_name_en do
    (object.person.country && object.person.country.name_en) || UNKNOWN
  end

  attribute :birthday do
    "#{object.person.birthday_year || UNKNOWN}年"\
    "#{object.person.birthday_month || UNKNOWN}月"\
    "#{object.person.birthday_day || UNKNOWN}日"
  end

  attribute :link do
    object.person.link || UNKNOWN
  end

  attribute :twitter do
    object.person.twitter || UNKNOWN
  end
end
