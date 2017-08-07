module ImageValidator
  extend ActiveSupport::Concern

  included do
    validates :image,
      allow_nil: true,
      format: { with: /\Ahttp\:\/\/|https\:\/\//,
                message: 'Must be URL http://... or https://...' }
    validates :image,
      allow_nil: true,
      format: { with: /.jpg|.png|.jpeg\Z/,
                message: 'Image must be one of following type: .jpg, .png or .jpeg' }
  end
end