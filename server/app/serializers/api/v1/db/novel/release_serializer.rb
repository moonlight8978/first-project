class Api::V1::Db::Novel::ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :released, :title, :title_en, :status, :animation_ero,
    :animation_story, :voiced, :age_rating

  has_many :developers, serializer: Api::V1::Db::Novel::ProducerSerializer

  has_many :publishers, serializer: Api::V1::Db::Novel::ProducerSerializer
end
