class Feature::Review < ApplicationRecord
  validates :user_id, 
    presence: true,
    uniqueness: { 
      scope: [:reviewable_id, :reviewable_type], 
      message: 'You have already reviewed'
    }
  validates :body,
    presence: { message: 'Body cannot be empty!' }
  validates :title,
    presence: { message: 'Title cannot be empty!' }
    
  belongs_to :user, class_name: 'Security::User'
  
  belongs_to :reviewable, polymorphic: true

  default_scope { order(created_at: :desc) }
end
