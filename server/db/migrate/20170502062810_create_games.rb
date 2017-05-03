class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.belongs_to :game_product_ref, index: true

      t.string :title
      t.string :original

      t.timestamps
    end
  end
end
