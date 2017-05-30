class CreateVndbNovels < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_novels do |t|
      t.belongs_to :product       , index: true
      t.string     :title
      t.string     :original_title, null: false
      t.string     :aliases
      t.integer    :length        , null: false
      t.text       :description
      t.text       :original_description
      t.string     :image         , null: false
      t.boolean    :image_nsfw    , null: false

      t.timestamps
    end
  end
end
