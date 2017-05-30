class CreateGeneralCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :general_countries do |t|
      t.string :name,          null: false
      t.string :original_name, null: false
      t.string :image
      
      t.timestamps
    end
  end
end
