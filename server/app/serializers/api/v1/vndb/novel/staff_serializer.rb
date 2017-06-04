class Api::V1::Vndb::Novel::StaffSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :note, :position

  attribute :id do
    object.person.id
  end

  attribute :name do
    object.person.name
  end

  attribute :original_name do
    object.person.original_name
  end

  attribute :country_name do
    (object.person.country && object.person.country.name) || UNKNOWN
  end

  attribute :country_original_name do
    (object.person.country && object.person.country.original_name) || UNKNOWN
  end

  attribute :birthday do
    "#{object.person.birthday_year || UNKNOWN}年"\
    "#{object.person.birthday_month || UNKNOWN}月"\
    "#{object.person.birthday_day || UNKNOWN}日"
  end

  attribute :link do
    object.person.link || UNKNOWN
  end

  attribute :twitter_url do
    object.person.twitter_url || UNKNOWN
  end
end
