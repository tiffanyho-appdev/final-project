class ChangePlaceIdToBeStringInPlannedFuns < ActiveRecord::Migration[5.1]
  def change
    change_column :planned_funs, :place_id, :string
  end
end
