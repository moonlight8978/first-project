class CreateVndbVoiceActresses < ActiveRecord::Migration[5.1]
  def change
    create_table :vndb_voice_actresses do |t|
      t.belongs_to :person,    null: false, index: true
      t.belongs_to :character, null: false, index: true
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
