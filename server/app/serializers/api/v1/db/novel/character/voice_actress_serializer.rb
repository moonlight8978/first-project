class Api::V1::Db::Novel::Character::VoiceActressSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :name, :name_en, :country, :alias, :alias_en

  def name
    object.person && object.person.name
  end

  def name_en
    object.person && object.person.name_en
  end

  def country
    object.person && object.person.country
  end
end
