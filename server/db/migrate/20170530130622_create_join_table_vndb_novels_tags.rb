class CreateJoinTableVndbNovelsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :novels, :tags, id: false, table_name: :vndb_novels_vndb_tags do |t|
      t.index [:novel_id, :tag_id]
      # t.index [:tag_id, :novel_id]
    end
  end
end
