class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.belongs_to :company , null: false, index: true
      t.belongs_to :game    , null: false, index: true
      t.date       :released, null: false

      t.timestamps
    end
  end
end
