class Api::V1::Vndb::Novel::DetailSerializer < ActiveModel::Serializer
  # LENGTH = [
  #   'Very short (< 2 hours)', 'Short (2 - 10 hours)', 'Medium (10 - 30 hours)',
  #   'Long (30 - 50 hours)', 'Very long (> 50 hours)'
  # ]

  attributes :id, :title, :title_en, :description, :description_en, :length,
    :image, :image_nsfw, :image_description

  attribute :characters, if: -> { object.full_info }
  attribute :staffs, if: -> { object.full_info }
  attribute :producers, if: -> { object.full_info }

  has_many :releases, if: -> { object.full_info }
  has_many :screenshots, if: -> { object.full_info }
  has_many :tags, if: -> { object.full_info }

  def characters
    object.characters_grouped
  end

  def staffs
    object.staffs_grouped
  end
end
