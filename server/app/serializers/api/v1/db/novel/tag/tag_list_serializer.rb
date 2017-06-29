class Api::V1::Db::Novel::Tag::TagListSerializer < ActiveModel::Serializer
  attributes :id, :tag, :tag_en
end
