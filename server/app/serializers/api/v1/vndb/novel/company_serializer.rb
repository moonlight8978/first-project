class Api::V1::Vndb::Novel::CompanySerializer < ActiveModel::Serializer
  UNKNOWN = '不明'

  attributes :id, :name, :name_en, :flag

  def flag
    object.country && object.country.image
  end
end
