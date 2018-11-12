class ChangeNullToTrueUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username, :string, :null => true
    change_column :users, :phone, :string, :null => true
    change_column :users, :address, :string, :null => true
  end
end
