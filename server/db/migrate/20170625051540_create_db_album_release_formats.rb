class CreateDbAlbumReleaseFormats < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_release_formats do |t|
      t.string :format, null: false

      t.timestamps
    end
  end
end
