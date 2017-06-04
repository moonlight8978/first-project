class CreateJoinTableVndbDevelopedsDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :releases, id: false, table_name: :vndb_developeds_vndb_developers do |t|
      t.index [:company_id, :release_id], name: :index_developeds_developers
      # t.index [:release_id, :company_id]
    end
  end
end
