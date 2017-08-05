class Api::V1::Db::Novel::Character::CharacterNovelSerializer < ActiveModel::Serializer
  attributes :character_novel_id, :id, :title, :title_en, :image, :image_nsfw

  has_many :voice_actresses, serializer: Api::V1::Db::Novel::Character::VoiceActressSerializer

  def character_novel_id
    object.id
  end

  def id
    object.novel.id
  end

  def title
    object.novel.title
  end

  def title_en
    object.novel.title_en
  end

  def image
    object.novel.image
  end

  def image_nsfw
    object.novel.image_nsfw
  end
end
