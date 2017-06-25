class CreateDbAlbumReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_releases do |t|
      t.belongs_to :format,      index: true
      t.date       :released
      t.string     :catalog_num, index: true

      t.timestamps
    end
  end
end
