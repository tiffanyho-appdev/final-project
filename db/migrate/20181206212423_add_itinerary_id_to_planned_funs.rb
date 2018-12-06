class AddItineraryIdToPlannedFuns < ActiveRecord::Migration[5.1]
  def change
    add_column :planned_funs, :itinerary_id, :integer
  end
end
