class CreateDbAlbumClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_classifications do |t|
      t.string     :type,    null: false
      t.string     :type_en, null: false

      t.timestamps
    end
  end
end
