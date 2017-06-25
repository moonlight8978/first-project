class CreateDbNovelScreenshots < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_screenshots do |t|
      t.belongs_to :novel,                   index: true
      t.string     :image,      null: false
      t.boolean    :image_nsfw, null: false

      t.timestamps
    end
  end
end
