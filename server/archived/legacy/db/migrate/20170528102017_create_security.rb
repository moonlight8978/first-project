class CreateSecurity < ActiveRecord::Migration[5.1]
  def change
    create_table :security_users do |t|
      t.string  :user_name,       null: false, unique: true, index: true
      t.string  :password_digest, null: false
      t.string  :email,           null: false, unique: true, index: true
      t.string  :phone_number
      t.string  :address
      t.boolean :activated,                    default: false

      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :profile_image
      t.date   :birthday
      t.text   :about
      t.string :signature
      t.belongs_to :country, index: true

      t.string :facebook
      t.string :twitter
      t.string :gmail

      t.datetime :password_updated_at, null: false, default: Time.zone.now

      t.timestamps
    end

    create_table :security_roles do |t|
      t.string :role, null: false, unique: true

      t.timestamps
    end

    create_join_table :roles, :users, id: false, table_name: :security_roles_security_users do |t|
      t.index [:user_id, :role_id]
    end

    create_table :security_activate_account_tokens do |t|
      t.belongs_to :user,       null: false, index: true
      t.string     :token,      null: false
      t.datetime   :expiration, null: false

      t.timestamps
    end

    create_table :security_reset_password_tokens do |t|
      t.belongs_to :user,       null: false, index: true
      t.string     :token,      null: false
      t.datetime   :expiration, null: false

      t.timestamps
    end

    create_table :security_invalid_tokens do |t|
      t.string   :token, null: false
      t.datetime :expiration, null: false

      t.timestamps
    end
  end
end
