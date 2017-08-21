class AddCodeToCountry < ActiveRecord::Migration[5.1]
  def change
    remove_column :countries, :image
    add_column :countries, :code, :string, index: true
  end
end
