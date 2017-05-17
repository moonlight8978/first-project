class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.string :phone_number, null: true
      t.string :address, null: true
      t.boolean :activated, null: true, default: false

      t.string :first_name, null: true
      t.string :last_name, null: true
      t.string :profile_image_url, null: true
      t.date :birthday, null: true
      t.text :about, null: true
      t.string :signature, null: true
      t.string :country, null: true

      t.string :facebook_url, null: true
      t.string :twitter_url, null: true
      t.string :gmail_url, null: true

      t.string :reset_password_token, null: true
      t.string :forget_password_token, null: true
      t.string :activate_account_token, null: true

      t.timestamps
    end

    create_table :roles do |t|
      t.string :role, null: false, unique: true

      t.timestamps
    end

    create_table :authorities do |t|
      t.belongs_to :role, index: true, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
