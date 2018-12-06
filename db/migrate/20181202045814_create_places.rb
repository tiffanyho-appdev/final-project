class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :place_name
      t.string :place_address
      t.string :place_description
      t.float :place_rating
      t.string :place_link
      t.string :place_pic

      t.timestamps
    end
  end
end
