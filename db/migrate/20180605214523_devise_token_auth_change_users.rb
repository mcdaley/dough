class DeviseTokenAuthChangeUsers < ActiveRecord::Migration[5.2]
  #
  # Add columns in users db table to support devise_token_auth
  #
  def change
    change_table(:users) do |t|
      ## Required
      t.string    :provider, :null => false, :default => "email"
      t.string    :uid,      :null => false, :default => ""

      ## User Info
      t.string    :nickname
      t.string    :image

      ## Tokens
      t.json      :tokens
    end

    add_index :users, [:uid, :provider],     unique: true
  end
end
