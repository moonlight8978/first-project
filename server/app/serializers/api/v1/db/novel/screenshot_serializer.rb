class Api::V1::Db::Novel::ScreenshotSerializer < ActiveModel::Serializer
  attributes :id, :image, :image_nsfw
end
