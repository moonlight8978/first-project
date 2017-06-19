class CreateVndbReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_releases do |t|
      t.belongs_to :platform,        null: false, index: true
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

    create_join_table :novels, :releases, id: false,
      table_name: :vndb_novels_vndb_releases do |t|

      t.index [:novel_id, :release_id], name: :index_novels_releases
    end

    create_join_table :companies, :releases, id: false,
      table_name: :vndb_developeds_vndb_developers do |t|

      t.index [:company_id, :release_id], name: :index_developeds_developers
    end

    create_join_table :companies, :releases, id: false,
      table_name: :vndb_publisheds_vndb_publishers do |t|

      t.index [:company_id, :release_id], name: :index_publisheds_publishers
    end
  end
end
