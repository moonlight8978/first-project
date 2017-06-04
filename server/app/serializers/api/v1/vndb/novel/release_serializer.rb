class Api::V1::Vndb::Novel::ReleaseSerializer < ActiveModel::Serializer
  voiced = ['No voiced', 'Partial voiced', 'Fully voiced']
  animation_story = ['No animation', 'Simple animations']
  animation_ero = ['No animation', 'Simple animations']

  attributes :id, :released

  attribute :voiced do
    voiced[object.voiced]
  end

  attribute :animation_story do
    animation_story[object.animation_story]
  end

  attribute :animation_ero do
    animation_ero[object.animation_ero]
  end

  has_many :developers

  has_many :publishers
end
