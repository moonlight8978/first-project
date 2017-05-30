class CreateVndbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_people do |t|
      t.string :name
      t.string :original_name
      t.string :birthday

      t.timestamps
    end
  end
end
