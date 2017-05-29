class CreateVndbCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_companies do |t|
      t.string  :name
      t.string  :original_name, null: false
      t.string  :country      , null: false
      t.string  :link         , null: false

      t.timestamps
    end
  end
end