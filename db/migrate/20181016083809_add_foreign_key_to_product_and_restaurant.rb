class AddForeignKeyToProductAndRestaurant < ActiveRecord::Migration[5.2]
  def change
      add_reference :restaurants, :restaurant_type, foreign_key: true
      add_reference :products, :product_type, foreign_key: true
  end
end
