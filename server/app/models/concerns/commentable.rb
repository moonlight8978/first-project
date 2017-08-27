module Commentable
  extend ActiveSupport::Concern
  
  included do
    has_many :comments, as: :commentable, class_name: 'Feature::Comment', 
      counter_cache: true
  end
end