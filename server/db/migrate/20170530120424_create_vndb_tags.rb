class CreateVndbTags < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_tags do |t|
      t.string :tag, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
