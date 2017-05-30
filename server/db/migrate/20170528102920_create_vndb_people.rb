class CreateVndbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_people do |t|
      t.belongs_to :country,   index: true
      t.string :name
      t.string :original_name
      t.string :birthday
      t.string :link

      t.timestamps
    end
  end
end
