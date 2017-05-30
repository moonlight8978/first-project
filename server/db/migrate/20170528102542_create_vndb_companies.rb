class CreateVndbCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_companies do |t|
      t.string     :name
      t.string     :original_name, null: false
      t.belongs_to :country      , null: false, index: true
      t.string     :link         , null: false

      t.timestamps
    end
  end
end
