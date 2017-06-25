class CreateSecurityUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :security_user_roles do |t|
      t.string :role, null: false, unique: true

      t.timestamps
    end

    create_join_table :roles, :users, id: false, table_name: :security_roles_users do |t|
      t.index [:user_id, :role_id]
    end
  end
end
