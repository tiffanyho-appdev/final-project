class AddLocationOfTripToItineraries < ActiveRecord::Migration[5.1]
  def change
    add_column :itineraries, :location_of_trip, :string
  end
end
