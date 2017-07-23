class Api::V1::Feature::Rating::RatingListSerializer < ActiveModel::Serializer
  attributes :star, :updated_at

  belongs_to :user, serializer: Api::V1::Security::UserSerializer
end
