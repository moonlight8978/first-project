class CreateSecurityRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :security_roles do |t|
      t.string :role, null: false, unique: true

      t.timestamps
    end
  end
end
