class Api::V1::CountrySerializer < ActiveModel::Serializer
  attributes :name, :name_en, :code
end
