class CreateDbAlbumDiscSongSingers < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_disc_song_singers do |t|
      t.belongs_to :person, index: true
      t.belongs_to :song,   index: true
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
