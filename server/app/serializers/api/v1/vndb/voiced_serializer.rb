class Api::V1::Vndb::VoicedSerializer < ActiveModel::Serializer
  attributes :alias, :original_alias

  attribute :name do
    object.character.name
  end

  attribute :original_name do
    object.character.original_name
  end

  attribute :novel do
    object.character.novel.title
  end
end
