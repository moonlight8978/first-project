class Api::V1::Vndb::Novel::ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :image, :image_nsfw, :length
end
