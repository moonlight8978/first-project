class CreateSecurityAuthorities < ActiveRecord::Migration[5.1]
  def change
    create_table :security_authorities do |t|
      t.belongs_to :role, index: true, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
