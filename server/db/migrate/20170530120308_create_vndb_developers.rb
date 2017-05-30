class CreateVndbDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_developers do |t|
      t.belongs_to :company, null: false, index: true
      t.belongs_to :release, null: false, index: true

      t.timestamps
    end
  end
end
