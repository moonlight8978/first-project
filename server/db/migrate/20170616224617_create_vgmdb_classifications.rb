class CreateVgmdbClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :vgmdb_classifications do |t|
      t.string     :type,    null: false
      t.string     :type_en, null: false

      t.timestamps
    end

    create_join_table :albums, :classifications, id: false,
      table_name: :vgmdb_albums_vgmdb_classifications do |t|

      t.index [:album_id, :classification_id], name: :index_albums_classifications
    end
  end
end
