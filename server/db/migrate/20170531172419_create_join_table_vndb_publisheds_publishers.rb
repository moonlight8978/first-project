class CreateJoinTableVndbPublishedsPublishers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :releases, id: false, table_name: :vndb_publisheds_vndb_publishers do |t|
      t.index [:company_id, :release_id], name: :index_publisheds_publishers
      # t.index [:release_id, :company_id]
    end
  end
end
