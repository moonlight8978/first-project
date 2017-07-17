class Api::V1::Db::Novel::NovelDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :description, :description_en, :length,
    :image, :image_nsfw, :image_description, :released

  attribute :characters, if: -> { object.full_info }
  attribute :staffs,     if: -> { object.full_info }

  has_many :producers,   serializer: Api::V1::Db::Novel::ProducerSerializer
  has_many :releases,    if: -> { object.full_info }
  has_many :screenshots, if: -> { object.full_info }
  has_many :tags,        if: -> { object.full_info }

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
