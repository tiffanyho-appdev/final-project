class ChangeOrderInDayToBeStringInPlannedFuns < ActiveRecord::Migration[5.1]
  def change
    change_column :planned_funs, :order_in_day, :string
  end
end
