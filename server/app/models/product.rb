class Product < ApplicationRecord
  has_one :game,
    through: :game_product_ref
  has_one :game_product_ref

  has_one :cd,
    through: :cd_product_ref
  has_one :cd_product_ref

  def as_json(options = {})
    super(options.merge(include: [:cd, :game]))
  end
end
