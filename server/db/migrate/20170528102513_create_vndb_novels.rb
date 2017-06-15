class CreateVndbNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_novels do |t|
      t.belongs_to :product,                          index: true
      t.string     :title,              null: false
      t.string     :title_en
      t.integer    :length,             null: false
      t.text       :description
      t.text       :description_en
      t.string     :image,              null: false
      t.string     :image_description
      t.boolean    :image_nsfw,         null: false

      t.timestamps
    end
  end
end
