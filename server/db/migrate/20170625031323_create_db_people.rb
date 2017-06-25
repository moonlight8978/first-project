class CreateDbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :db_people do |t|
      t.belongs_to :country,                     index: true
      t.string     :name,           null: false
      t.string     :name_en,        null: false
      t.integer    :gender
      t.integer    :birthday_day
      t.integer    :birthday_month
      t.integer    :birthday_year
      t.string     :link
      t.string     :twitter

      t.timestamps
    end
  end
end
