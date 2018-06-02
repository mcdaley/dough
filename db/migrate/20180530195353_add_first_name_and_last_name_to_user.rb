class AddFirstNameAndLastNameToUser < ActiveRecord::Migration[5.2]
  #
  # Add first name and last name columns to users table
  #
  def change
    change_table :users do |t|
      t.string  :first_name
      t.string  :last_name
    end
  end
end
