class CreateCds < ActiveRecord::Migration[5.0]
  def change
    create_table :cds do |t|
      t.belongs_to :cd_product_ref
      t.string :title

      t.timestamps
    end
  end
end
