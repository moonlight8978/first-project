class Api::V1::Db::Novel::NovelListSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :image, :image_nsfw, :length, :released

  def released
    object.first_release && object.first_release.released
  end
end
