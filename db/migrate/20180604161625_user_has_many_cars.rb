class UserHasManyCars < ActiveRecord::Migration[5.2]
  def change
    change_table :cars do |t|
      t.integer :user_id, :limit => 8   # Create bigint column in DB
    end
  end
end
