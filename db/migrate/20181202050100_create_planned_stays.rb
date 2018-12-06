class CreatePlannedStays < ActiveRecord::Migration[5.1]
  def change
    create_table :planned_stays do |t|
      t.integer :hotel_id
      t.integer :day_id
      t.integer :order_in_day

      t.timestamps
    end
  end
end
