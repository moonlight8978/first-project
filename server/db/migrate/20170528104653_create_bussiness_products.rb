class CreateBussinessProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :bussiness_products do |t|
      t.belongs_to :type,  null: false, index: true
      t.integer    :price, null: false

      t.timestamps
    end
  end
end
