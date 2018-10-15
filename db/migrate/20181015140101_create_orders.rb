class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :total
      t.string :note
      t.integer :feeship
      t.integer :buyer_id
      t.integer :shipper_id, allow_null: true
      t.integer :payments

      t.timestamps
    end
  end
end
