class Db::Novel::Screenshot < ApplicationRecord
  before_destroy :check_nsfw

  after_initialize :set_default

  validates :image, presence: true,
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :image,
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: 'Image must be one of following type: .jpg, .png or .jpeg' }

  belongs_to :novel

private

  def check_nsfw
    unless self.image_nsfw
      self.errors.add(:can_not_destroy, 'Object cannot destroy')
      throw(:abort)
    end
  end

  def set_default
    self.image_nsfw ||= false
  end
end
