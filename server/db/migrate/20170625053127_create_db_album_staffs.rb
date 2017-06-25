class CreateDbAlbumStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_album_staffs do |t|
      t.belongs_to :album,    null: false, index: true
      t.belongs_to :person,   null: false, index: true
      t.string     :position, null: false
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
