class CreateCdProductRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :cd_product_refs do |t|
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
