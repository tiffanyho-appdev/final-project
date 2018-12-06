class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
