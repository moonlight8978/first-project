class Api::V1::Db::Novel::ProducerSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en

  belongs_to :country, serializer: Api::V1::CountrySerializer
end
