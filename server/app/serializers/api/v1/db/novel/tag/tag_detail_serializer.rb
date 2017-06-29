class Api::V1::Db::Novel::Tag::TagDetailSerializer < ActiveModel::Serializer
  attributes :id, :tag, :tag_en, :description, :description_en
end
