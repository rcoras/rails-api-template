class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.date :trip_date
      t.integer :trip_length_hrs
      t.string :location
      t.integer :no_of_fish_caught
      t.string :comments

      t.timestamps
    end
  end
end
