class Vndb::Character < ApplicationRecord
  belongs_to :novel

private

  def three_sizes
    "#{self.bust}-#{self.waist}-#{self.hip}cm"
  end
end
