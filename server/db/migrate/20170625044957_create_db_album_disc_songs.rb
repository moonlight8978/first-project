class CreateDbAlbumDiscSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_disc_songs do |t|
      t.belongs_to :disc,           null: false, index: true
      t.string     :name,           null: false
      t.string     :name_en
      t.integer    :length_second,  null: false
      t.integer    :length_minute,  null: false

      t.timestamps
    end
  end
end
