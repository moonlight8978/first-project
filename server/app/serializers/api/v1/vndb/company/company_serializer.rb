class Api::V1::Vndb::Company::CompanySerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :country_name, :country_name_en, :link

  def country_name
    (object.country && object.country.name) || UNKNOWN
  end

  def country_name_en
    (object.country && object.country.name_en) || UNKNOWN
  end
end
