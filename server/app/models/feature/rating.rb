class Feature::Rating < ApplicationRecord
  belongs_to :user, class_name: 'Security::User'
  belongs_to :rateable, polymorphic: true

  default_scope { order(created_at: :desc) }
end
