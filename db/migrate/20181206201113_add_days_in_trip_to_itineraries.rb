class AddDaysInTripToItineraries < ActiveRecord::Migration[5.1]
  def change
    add_column :itineraries, :days_in_trip, :integer
  end
end
