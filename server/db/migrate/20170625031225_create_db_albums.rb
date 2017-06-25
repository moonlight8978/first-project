class CreateDbAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :db_albums do |t|
      t.belongs_to :novel,                    index: true
      t.string     :title,      null: false
      t.string     :title_en

      t.timestamps
    end

    create_join_table :albums, :classifications, id: false,
      table_name: :db_albums_album_classifications do |t|

      t.index [:album_id, :classification_id], name: :index_albums_classifications
    end
  end
end
