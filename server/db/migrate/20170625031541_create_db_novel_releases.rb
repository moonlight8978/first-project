class CreateDbNovelReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_releases do |t|
      t.belongs_to :platform,        null: true,  index: true, default: nil
      t.string     :title,           null: false
      t.string     :title_en
      t.integer    :status,          null: false, index: true
      t.integer    :voiced
      t.integer    :animation_story
      t.integer    :animation_ero
      t.date       :released,        null: false
      t.integer    :age_rating
      t.string     :jan_num,                      index: true

      t.timestamps
    end

    create_join_table :novels, :releases, id: false,
      table_name: :db_novels_novel_releases do |t|

      t.index [:novel_id, :release_id], name: :index_novels_releases
    end

    create_join_table :companies, :releases, id: false,
      table_name: :db_developers_novel_releases do |t|

      t.index [:company_id, :release_id], name: :index_developers_releases
    end

    create_join_table :companies, :releases, id: false,
      table_name: :db_publishers_novel_releases do |t|

      t.index [:company_id, :release_id], name: :index_publishers_releases
    end
  end
end
