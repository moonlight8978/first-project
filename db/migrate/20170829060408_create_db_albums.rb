class CreateDbAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :db_albums do |t|
      t.string :title
      t.string :title_en
      t.string :title_pronounce, index: true
      t.string :image
      
      t.timestamps
    end
    
    add_index :db_albums, :created_at
    add_index :db_albums, :updated_at
  end
end
