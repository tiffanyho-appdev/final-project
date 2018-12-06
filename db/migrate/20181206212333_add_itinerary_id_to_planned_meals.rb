class AddItineraryIdToPlannedMeals < ActiveRecord::Migration[5.1]
  def change
    add_column :planned_meals, :itinerary_id, :integer
  end
end
