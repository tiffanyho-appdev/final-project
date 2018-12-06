class CreatePlannedMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :planned_meals do |t|
      t.integer :rest_id
      t.integer :day_id
      t.integer :order_in_day

      t.timestamps
    end
  end
end
