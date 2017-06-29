class Api::V1::Db::Novel::ProducerSerializer < ActiveModel::Serializer
  attributes :id, :name, :name_en, :country_flag, :country_name

  def country_flag
    object.country && object.country.image
  end

  def country_name
    object.country && object.country.name
  end
end
