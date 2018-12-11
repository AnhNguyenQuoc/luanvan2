class ChangePriceTypeProductToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :integer, default: 0
  end
end
