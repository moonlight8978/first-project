class CreateDbAlbumCovers < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_covers do |t|
      t.belongs_to :album,      null: false, index: true
      t.string     :image,      null: false
      t.string     :image_nsfw,              default: false

      t.timestamps
    end
  end
end
