class Feature::Comment < ApplicationRecord
  validates :user, 
    presence: true
  validates :body,
    presence: { message: 'Body cannot be empty!' }
    
  belongs_to :user, class_name: 'Security::User'

  belongs_to :commentable, polymorphic: true
  
  default_scope { order(created_at: :desc) }
end
