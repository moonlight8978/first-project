class Api::V1::Db::Novel::Release::NovelSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :image, :image_nsfw, :length
end
