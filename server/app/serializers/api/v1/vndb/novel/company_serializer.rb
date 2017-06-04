class Api::V1::Vndb::Novel::CompanySerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :original_name, :link

  attribute :country_name do
    (object.country && object.country.name) || UNKNOWN
  end

  attribute :country_original_name do
    (object.country && object.country.original_name) || UNKNOWN
  end
end
