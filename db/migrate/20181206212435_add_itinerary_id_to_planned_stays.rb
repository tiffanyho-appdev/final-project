class AddItineraryIdToPlannedStays < ActiveRecord::Migration[5.1]
  def change
    add_column :planned_stays, :itinerary_id, :integer
  end
end
