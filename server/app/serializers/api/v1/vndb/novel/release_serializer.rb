class Api::V1::Vndb::Novel::ReleaseSerializer < ActiveModel::Serializer
  VOICED = ['No voiced', 'Partial voiced', 'Fully voiced']
  ANIMATION_ERO = ['No animation', 'Simple animations']
  ANIMATION_STORY = ['No animation', 'Simple animations']

  attributes :id, :released, :title, :title_en, :status, :animation_ero,
    :animation_story, :voiced, :age_rating

  has_many :developers

  has_many :publishers

  def voiced
    object.voiced && VOICED[object.voiced]
  end

  def animation_story
    object.animation_story && ANIMATION_STORY[object.animation_story]
  end

  def animation_ero
    object.animation_story && ANIMATION_ERO[object.animation_story]
  end
end
