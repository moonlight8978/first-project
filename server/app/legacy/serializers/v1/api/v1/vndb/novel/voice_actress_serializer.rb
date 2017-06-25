class Api::V1::Vndb::Novel::VoiceActressSerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :gender, :alias, :alias_en, :flag

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

  def flag
    object.person.country && object.person.country.image
  end
end
