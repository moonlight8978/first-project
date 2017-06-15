class Api::V1::Vndb::Novel::CompanySerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :link

  attribute :country_name do
    (object.country && object.country.name) || UNKNOWN
  end

  attribute :country_name_en do
    (object.country && object.country.name_en) || UNKNOWN
  end
end
