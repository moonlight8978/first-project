class Api::V1::Db::Person::StaffSerializer < ActiveModel::Serializer
  attributes :id, :position, :note, :alias, :alias_en, 
    :novel_id, :novel_title, :novel_title_en, :novel_released
    
  def novel_title
    object.novel.title
  end
  
  def novel_title_en
    object.novel.title_en
  end
  
  def novel_released
    object.novel.first_release && object.novel.first_release.released
  end
end
