class Api::V1::Db::Novel::Character::VoiceActressSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :name, :name_en, :country_flag,
    :country_name, :country_name_en

  def name
    object.alias || (object.person && object.person.name)
  end

  def name_en
    object.alias_en || (object.person && object.person.name_en)
  end

  def country_flag
    object.person && object.person.country && object.person.country.image
  end

  def country_name
    object.person && object.person.country && object.person.country.name
  end

  def country_name_en
    object.person && object.person.country && object.person.country.name_en
  end
end
