class CreateDbCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :db_companies do |t|
      t.belongs_to :country,              index: true

      t.string     :name,    null: false
      t.string     :name_en
      t.string     :link,    null: false

      t.timestamps
    end
  end
end
