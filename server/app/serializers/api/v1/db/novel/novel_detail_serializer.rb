class Api::V1::Db::Novel::NovelDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :description, :description_en, :length,
    :image, :image_nsfw, :image_description, :released, :rating

  attribute :characters, if: -> { object.full_info }
  attribute :staffs,     if: -> { object.full_info }
  attribute :ratings_statistics, if: -> { object.full_info }

  has_many :producers,
    serializer: Api::V1::Db::Novel::ProducerSerializer
  has_many :releases,    if: -> { object.full_info }
  has_many :screenshots, if: -> { object.full_info }
  has_many :tags,        if: -> { object.full_info }
  has_many :ratings,     if: -> { object.full_info }, key: :ratings_detail,
    serializer: Api::V1::Feature::Rating::RatingListSerializer
  has_many :reviews,    if: -> { object.full_info }

  def rating
    object.ratings && object.ratings.avg
  end

  def ratings_statistics
    object.ratings && object.ratings.statistics
  end

  def characters
    object.characters_grouped
  end

  def staffs
    object.staffs_grouped
  end

  def released
    object.first_release && object.first_release.released
  end
end
