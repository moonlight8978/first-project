class CreateDbNovelStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :db_novel_staffs do |t|
      t.belongs_to :person,   null: false, index: true
      t.belongs_to :novel,    null: false, index: true
      t.string     :position, null: false, default: 'staff'
      t.string     :note
      t.string     :alias
      t.string     :alias_en

      t.timestamps
    end
  end
end
