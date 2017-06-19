class CreateBussiness < ActiveRecord::Migration[5.1]
  def change
    create_table :bussiness_products do |t|
      t.belongs_to :type,  null: false, index: true
      t.integer    :price, null: false

      t.timestamps
    end

    create_table :bussiness_types do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
