class Api::V1::Db::Person::VoiceActressSerializer < ActiveModel::Serializer
  attributes :id, :alias, :alias_en
  
  belongs_to :character_novel, serializer: Api::V1::Db::Person::CharacterNovelSerializer
end
