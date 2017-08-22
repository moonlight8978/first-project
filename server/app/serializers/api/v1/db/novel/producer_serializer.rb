class Api::V1::Db::Novel::ProducerSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en, :country_name

  def country_name
    object.country && object.country.name
  end
end
