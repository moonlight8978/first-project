class CreateSecurityUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :security_users do |t|
      t.belongs_to :country, index: true

      t.string  :user_name,       null: false, unique: true, index: true
      t.string  :password_digest, null: false
      t.string  :email,           null: false, unique: true, index: true
      t.string  :phone_number
      t.string  :address

      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :profile_image
      t.date   :birthday
      t.text   :about
      t.string :signature

      t.string :facebook
      t.string :twitter
      t.string :gmail

      t.boolean  :activated,           null: false, default: false
      t.datetime :password_updated_at,              default: Time.zone.now

      t.timestamps
    end
  end
end
