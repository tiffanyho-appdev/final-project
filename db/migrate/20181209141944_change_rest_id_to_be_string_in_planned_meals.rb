class ChangeRestIdToBeStringInPlannedMeals < ActiveRecord::Migration[5.1]
  def change
    change_column :planned_meals, :rest_id, :string
  end
end
