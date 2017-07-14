class CreateDbNovelCharacterNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_character_novels do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :novel,     null: false, index: true

      t.timestamps
    end
  end
end
