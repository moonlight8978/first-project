class CreateVndbPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_people do |t|
      t.belongs_to :country,   index: true
      t.string     :name
      t.string     :original_name
      t.integer    :birthday_day
      t.integer    :birthday_month
      t.integer    :birthday_year
      t.string     :link
      t.string     :twitter_url

      t.timestamps
    end
  end
end
