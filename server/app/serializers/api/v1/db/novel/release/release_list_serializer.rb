class Api::V1::Db::Novel::Release::ReleaseListSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :platform, :status, :voiced, :animation_ero,
    :animation_story, :released

  def platform
    object.platform.platform
  end
end
