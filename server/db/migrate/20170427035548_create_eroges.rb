class CreateEroges < ActiveRecord::Migration[5.0]
  def change
    create_table :eroges do |t|
      t.string :title
      t.string :original_title

      t.timestamps
    end
  end
end
