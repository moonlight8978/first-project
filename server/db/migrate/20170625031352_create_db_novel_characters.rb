class CreateDbNovelCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_characters do |t|
      t.string     :name,           null: false
      t.string     :name_en,        null: false
      t.integer    :birthday_day
      t.integer    :birthday_month
      t.integer    :gender,         null: false
      t.integer    :weight
      t.integer    :height
      t.integer    :bust
      t.integer    :waist
      t.integer    :hips
      t.string     :blood_type
      t.string     :image
      t.integer    :role
      t.text       :description
      t.text       :description_en

      t.timestamps
    end
  end
end
