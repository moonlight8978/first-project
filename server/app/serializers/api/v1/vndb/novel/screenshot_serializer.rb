class Api::V1::Vndb::Novel::ScreenshotSerializer < ActiveModel::Serializer
  attributes :id, :image, :image_nsfw
end
