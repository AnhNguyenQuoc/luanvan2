class AddStripeCardTokenToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :card_token, :string
  end
end
