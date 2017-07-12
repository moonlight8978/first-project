class Db::Novel::Screenshot < ApplicationRecord
  validates :image, presence: true,
    format: { with: /\Ahttp\:\/\/|https\:\/\//,
              message: 'Must be URL http://... or https://...' }
  validates :image,
    format: { with: /.jpg|.png|.jpeg\Z/,
              message: 'Image must be one of following type: .jpg, .png or .jpeg' }

  belongs_to :novel
end
