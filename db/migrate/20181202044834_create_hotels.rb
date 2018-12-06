class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_address
      t.float :hotel_rating
      t.string :hotel_link
      t.string :hotel_pic

      t.timestamps
    end
  end
end
