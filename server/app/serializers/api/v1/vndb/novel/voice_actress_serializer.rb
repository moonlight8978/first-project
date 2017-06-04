class Api::V1::Vndb::Novel::VoiceActressSerializer < ActiveModel::Serializer
  attributes :alias, :original_alias

  attribute :id do
    object.person.id
  end

  attribute :name do
    object.person.name
  end

  attribute :original_name do
    object.person.original_name
  end

  attribute :link do
    object.person.link
  end

  attribute :twitter_url do
    object.person.twitter_url
  end
end
