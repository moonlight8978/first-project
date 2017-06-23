class Vndb::Character < ApplicationRecord
  has_many :voice_actresses
  has_many :people, through: :voice_actresses
  has_many :novels, through: :voice_actresses

  has_many :comments, as: :commentable, class_name: 'Feature::Comment'
  has_many :ratings,  as: :rateable,    class_name: 'Feature::Rating'

private

  def three_sizes
    "#{self.bust}-#{self.waist}-#{self.hip}cm"
  end
end
