class Api::V1::Db::Person::CharacterNovelSerializer < ActiveModel::Serializer
  attributes :id,
    :novel_id, :novel_title, :novel_title_en, :novel_released, 
    :character_id, :character_name, :character_name_en
  
  def novel_title
    object.novel.title
  end
  
  def novel_title_en
    object.novel.title_en
  end
  
  def novel_released
    object.novel.first_release && object.novel.first_release.released
  end
  
  def character_name
    object.character.name
  end
  
  def character_name_en
    object.character.name_en
  end
end
