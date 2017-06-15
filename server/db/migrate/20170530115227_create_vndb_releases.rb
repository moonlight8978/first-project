class CreateVndbReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_releases do |t|
      t.belongs_to :novel,           null: false, index: true
      t.string     :title,           null: false
      t.string     :title_en
      t.integer    :status,          null: false, index: true
      t.integer    :voiced
      t.integer    :animation_story
      t.integer    :animation_ero
      t.date       :released,        null: false
      t.integer    :age_rating

      t.timestamps
    end
  end
end
