class CreateDbNovelTags < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_tags do |t|
      t.string :tag,            null: false, index: true, unique: true
      t.string :tag_en,         null: false, index: true, unique: true
      t.text   :description
      t.text   :description_en

      t.timestamps
    end

    create_join_table :novels, :tags, id: false, table_name: :db_novels_novel_tags do |t|
      t.index [:novel_id, :tag_id]
    end
  end
end
