class CreateDbAlbumDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_discs do |t|
      t.belongs_to :album,              index: true
      t.integer    :disc,  null: false

      t.timestamps
    end
  end
end
