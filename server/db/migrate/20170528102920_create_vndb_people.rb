class CreateVndbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_people do |t|
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

    create_table :vndb_staffs do |t|
      t.belongs_to :person,   null: false, index: true
      t.belongs_to :novel,    null: false, index: true
      t.string     :position, null: false, default: 'Staff'
      t.string     :note
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
