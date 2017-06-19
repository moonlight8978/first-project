class Vndb::Character < ApplicationRecord
  has_many :voice_actresses
  has_many :people, through: :voice_actresses
  has_many :novels, through: :voice_actresses

private

  def three_sizes
    "#{self.bust}-#{self.waist}-#{self.hip}cm"
  end
end
