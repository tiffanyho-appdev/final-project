class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.string :rest_address
      t.string :rest_genre
      t.float :rest_rating
      t.string :rest_link
      t.string :rest_pic
      t.string :rest_menu

      t.timestamps
    end
  end
end
