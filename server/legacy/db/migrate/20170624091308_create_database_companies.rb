class CreateDatabaseCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :database_companies do |t|
      t.string     :name,    null: false
      t.string     :name_en
      t.belongs_to :country, null: false, index: true
      t.string     :link,    null: false

      t.timestamps
    end
  end
end
