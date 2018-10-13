class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|

      t.string :name, null: false
      t.integer :phone, null: false
      t.string :address, null: false
      t.string :description, null: false
      t.time :timeopen, null: false
      t.time :timeclose, null: false

      t.timestamps
    end
  end
end
