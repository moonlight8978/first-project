class Feature::Comment < ApplicationRecord
  belongs_to :user, class_name: 'Security::User'

  belongs_to :commentable, polymorphic: true
  
  default_scope { order(created_at: :desc) }
end
