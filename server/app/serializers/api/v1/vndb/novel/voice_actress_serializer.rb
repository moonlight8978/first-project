class Api::V1::Vndb::Novel::VoiceActressSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :gender, :birthday, :alias, :alias_en,
    :country_name, :country_name_en, :link, :twitter

  def id
    object.person.id
  end

  def name
    object.person.name
  end

  def name_en
    object.person.name_en
  end

  def gender
    object.person.gender
  end

  def link
    object.person.link
  end

  def twitter
    object.person.twitter
  end

  def country_name
    (object.person.country && object.person.country.name) || UNKNOWN
  end

  def country_name_en
    (object.person.country && object.person.country.name_en) || UNKNOWN
  end

  def birthday
    "#{object.person.birthday_year || UNKNOWN}年"\
    "#{object.person.birthday_month || UNKNOWN}月"\
    "#{object.person.birthday_day || UNKNOWN}日"
  end
end
