class AddPronounceField < ActiveRecord::Migration[5.1]
  def change
    add_column :db_novels, :title_pronounce, :string, index: true
    add_column :db_novel_releases, :title_pronounce, :string, index: true

    add_column :security_users, :name_pronounce, :string, index: true

    add_column :db_novel_characters, :name_pronounce, :string, index: true

    add_column :db_people, :name_pronounce, :string, index: true

    add_column :db_companies, :name_pronounce, :string, index: true

    add_column :db_novel_character_novels, :role, :string
  end
end
