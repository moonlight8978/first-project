class Api::V1::Db::Novel::TagSerializer < ActiveModel::Serializer
  attributes :id, :tag, :tag_en
end
