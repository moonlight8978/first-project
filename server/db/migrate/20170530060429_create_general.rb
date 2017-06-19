class CreateGeneral < ActiveRecord::Migration[5.1]
  def change
    create_table :general_countries do |t|
      t.string :name,    null: false
      t.string :name_en, null: false
      t.string :image

      t.timestamps
    end
  end
end
