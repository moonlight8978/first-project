class CreateGameProductRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :game_product_refs do |t|
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
