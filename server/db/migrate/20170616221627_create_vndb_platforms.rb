class CreateVndbPlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_platforms do |t|
      t.string :platform, null: false

      t.timestamps
    end

    # create_join_table :novels, :platforms, id: false,
    #   table_name: :vndb_releases_vndb_platforms do |t|

    #   t.index [:release_id, :platform_id], name: :index_releases_platforms
    # end
  end
end
