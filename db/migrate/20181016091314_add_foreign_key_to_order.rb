class AddForeignKeyToOrder < ActiveRecord::Migration[5.2]
  def change
       add_reference :orders, :order_type, foreign_key: true, default: 1
  end
end
