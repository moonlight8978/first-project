class CreateSecurityUserResetPasswordTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :security_user_reset_password_tokens do |t|
      t.belongs_to :user,       null: false, index: true
      t.string     :token,      null: false
      t.datetime   :expiration, null: false

      t.timestamps
    end
  end
end
