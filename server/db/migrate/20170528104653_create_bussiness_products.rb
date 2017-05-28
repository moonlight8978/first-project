class CreateBussinessProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :bussiness_products do |t|
      t.integer :type
      t.integer :price

      t.timestamps
    end
  end
end
