class CreateSecurityUserOauths < ActiveRecord::Migration[5.1]
  def change
    create_table :security_user_oauths do |t|
      t.references :user, index: true
      t.string :token
      t.string :provider
      t.string :uid
      t.string :expiration

      t.index [:provider, :uid]

      t.timestamps
    end
  end
end
