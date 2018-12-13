class ChangeOrderInDayToBeStringInPlannedMeals < ActiveRecord::Migration[5.1]
  def change
    change_column :planned_meals, :order_in_day, :string
  end
end
