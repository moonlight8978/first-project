class CreateVndbCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_characters do |t|

      t.timestamps
    end
  end
end
