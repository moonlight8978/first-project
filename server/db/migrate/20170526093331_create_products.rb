class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :type
      t.integer :price

      t.timestamps
    end

    create_table :types do |t|
      t.string :type

      t.timestamps
    end
  end
end
