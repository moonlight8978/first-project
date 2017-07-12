class Api::V1::Vndb::Novel::TagSerializer < ActiveModel::Serializer
  attributes :id, :tag, :tag_en, :description, :description_en
end
