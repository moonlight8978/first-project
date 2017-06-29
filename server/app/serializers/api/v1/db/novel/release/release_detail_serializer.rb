class Api::V1::Db::Novel::Release::ReleaseDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :platform, :status, :voiced, :animation_ero,
    :animation_story, :released

  has_many :novels, serializer: Api::V1::Db::Novel::Release::NovelSerializer

  def platform
    object.platform.platform
  end
end
