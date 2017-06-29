class Api::V1::Db::Novel::Character::VoiceActressSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :novel_id, :name, :name_en, :alias, :alias_en

  def name
    object.person && object.person.name
  end

  def name_en
    object.person && object.person.name_en
  end
end
