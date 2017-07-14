class Country < ApplicationRecord
  before_save :standardized

  validates :name, :name_en,
    presence: true
  validates :image,
    presence: true,
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL (http://... or https://...)' }
  validates :image,
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: 'Image must be one of following type: .jpg, .png or .jpeg' }

private

  def standardized
    self.image.gsub(/\s+/, '')
  end
end
