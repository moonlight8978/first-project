class Api::V1::Vndb::Novel::NovelSerializer < ActiveModel::Serializer
  length = [
    'Very short (< 2 hours)', 'Short (2 - 10 hours)', 'Medium (10 - 30 hours)',
    'Long (30 - 50 hours)', 'Very long (> 50 hours)'
  ]

  attributes :product_id, :id, :title, :title_en, :description, :description_en,
    :image, :image_nsfw, :image_description

  attribute :length do
    length[object.length]
  end
end
