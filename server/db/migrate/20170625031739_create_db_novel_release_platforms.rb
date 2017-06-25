class CreateDbNovelReleasePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_release_platforms do |t|
      t.string :platform, null: false

      t.timestamps
    end
  end
end
