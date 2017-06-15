class Api::V1::Vndb::Company::ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :title, :title_en, :status, :animation_ero, :animation_story,
    :voiced, :age_rating
end
