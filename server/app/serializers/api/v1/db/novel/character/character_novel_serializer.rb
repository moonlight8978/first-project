class Api::V1::Db::Novel::Character::CharacterNovelSerializer < ActiveModel::Serializer
  attributes :character_novel_id, :id, :title, :title_en

  has_many :voice_actresses

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
end
