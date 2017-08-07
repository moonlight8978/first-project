class Feature::Rating < ApplicationRecord
  validates :user_id, 
    presence: true,
    uniqueness: { 
      scope: [:rateable_id, :rateable_type], 
      message: 'You have already voted'
    }
  validates :body,
    presence: { message: 'Body cannot be empty!' }
  
  belongs_to :user, class_name: 'Security::User'
  
  belongs_to :rateable, polymorphic: true

  default_scope { order(created_at: :desc) }
end
