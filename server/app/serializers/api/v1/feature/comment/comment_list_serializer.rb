class Api::V1::Feature::Comment::CommentListSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at
  
  belongs_to :user, serializer: Api::V1::Security::UserSerializer
  
  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
  
  def updated_at
    object.updated_at.strftime('%Y-%m-%d')
  end
end
