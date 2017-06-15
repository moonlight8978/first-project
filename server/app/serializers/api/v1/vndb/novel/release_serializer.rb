class Api::V1::Vndb::Novel::ReleaseSerializer < ActiveModel::Serializer
  voiced = ['No voiced', 'Partial voiced', 'Fully voiced']
  animation_story = ['No animation', 'Simple animations']
  animation_ero = ['No animation', 'Simple animations']

  attributes :id, :released, :title, :title_en, :status, :animation_ero, 
    :animation_story, :voiced, :age_rating

  has_many :developers

  has_many :publishers

  def voiced
    voiced[object.voiced]
  end

  def animation_story
    animation_story[object.animation_story]
  end

  def animation_ero
    animation_ero[object.animation_ero]
  end
end
