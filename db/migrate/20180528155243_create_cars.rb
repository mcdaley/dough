class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.integer :miles_per_gallon

      t.timestamps
    end
  end
end
