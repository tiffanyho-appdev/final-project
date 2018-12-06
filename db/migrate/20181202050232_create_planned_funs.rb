class CreatePlannedFuns < ActiveRecord::Migration[5.1]
  def change
    create_table :planned_funs do |t|
      t.integer :place_id
      t.integer :day_id
      t.integer :order_in_day

      t.timestamps
    end
  end
end
