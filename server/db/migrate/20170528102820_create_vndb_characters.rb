class CreateVndbCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_characters do |t|
      t.belongs_to :novel,          null: false, index: true
      t.string     :name,           null: false
      t.string     :original_name,  null: false
      t.integer    :birthday_day,   null: false
      t.integer    :birthday_month, null: false
      t.string     :gender,         null: false
      t.integer    :weight
      t.integer    :height
      t.integer    :bust
      t.integer    :waist
      t.integer    :hip
      t.string     :blood_type
      t.string     :image

      t.timestamps
    end
  end
end
