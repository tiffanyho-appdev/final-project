class AddOrderInItineraryToDays < ActiveRecord::Migration[5.1]
  def change
    add_column :days, :order_in_itinerary, :integer
  end
end
