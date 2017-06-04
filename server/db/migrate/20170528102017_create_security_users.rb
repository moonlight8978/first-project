class CreateSecurityUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :security_users do |t|
      t.string  :user_name,       null: false, unique: true, index: true
      t.string  :password_digest, null: false
      t.string  :email,           null: false, unique: true, index: true
      t.string  :phone_number,    null: true
      t.string  :address,         null: true
      t.boolean :activated,       null: true,  default: false

      t.string :first_name,         null: true
      t.string :middle_name,        null: true
      t.string :last_name,          null: true
      t.string :profile_image_url,  null: true
      t.date   :birthday,           null: true
      t.text   :about,              null: true
      t.string :signature,          null: true
      t.belongs_to :country,                    index: true

      t.string :facebook_url,       null: true
      t.string :twitter_url,        null: true
      t.string :gmail_url,          null: true

      t.datetime :password_updated_at,    null: false, default: Time.zone.now

      t.timestamps
    end
  end
end
