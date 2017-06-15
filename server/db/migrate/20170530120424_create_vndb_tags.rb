class CreateVndbTags < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_tags do |t|
      t.string :tag,            null: false, index: true, unique: true
      t.string :tag_en,         null: false, index: true, unique: true
      t.text   :description
      t.text   :description_en

      t.timestamps
    end
  end
end
