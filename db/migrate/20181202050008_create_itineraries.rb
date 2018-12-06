class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.integer :user_id
      t.string :name_of_trip

      t.timestamps
    end
  end
end
