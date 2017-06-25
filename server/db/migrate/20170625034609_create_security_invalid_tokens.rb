class CreateSecurityInvalidTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :security_invalid_tokens do |t|
      t.string   :token, null: false
      t.datetime :expiration, null: false

      t.timestamps
    end
  end
end
