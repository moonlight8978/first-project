class CreateVgmdbAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :vgmdb_albums do |t|
      t.belongs_to :novel,                    index: true
      t.belongs_to :format,                   index: true
      t.string     :title,      null: false
      t.string     :title_en
      t.string     :code
      t.date       :released

      t.timestamps
    end

    create_table :vgmdb_formats do |t|
      t.string :type, null: false

      t.timestamps
    end

    create_table :vgmdb_discs do |t|
      t.belongs_to :album,              index: true
      t.integer    :disc,  null: false

      t.timestamps
    end

    create_table :vgmdb_songs do |t|
      t.belongs_to :disc,           null: false, index: true
      t.string     :name,           null: false
      t.string     :name_en
      t.integer    :length_second,  null: false
      t.integer    :length_minute,  null: false

      t.timestamps
    end

    create_table :vgmdb_staffs do |t|
      t.belongs_to :person,   null: false, index: true
      t.belongs_to :song,     null: false, index: true
      t.string     :position, null: false
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
