class CreateVndbPublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_publishers do |t|
      t.belongs_to :company, null: false, index: true
      t.belongs_to :release, null: false, index: true

      t.timestamps
    end
  end
end
