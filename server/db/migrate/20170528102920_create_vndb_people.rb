class CreateVndbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_people do |t|

      t.timestamps
    end
  end
end
