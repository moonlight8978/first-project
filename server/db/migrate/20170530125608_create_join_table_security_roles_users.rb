class CreateJoinTableSecurityRolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :roles, :users, id: false, table_name: :security_roles_security_users do |t|
      # t.index [:role_id, :user_id]
      t.index [:user_id, :role_id]
    end
  end
end
