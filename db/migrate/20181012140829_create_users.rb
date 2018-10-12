class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, default: "", null: false 
      t.string :password
      t.string :username, default: "", null: false
      t.string :address, default: "", null: false 
      t.integer :phone, default: "", null: false
      

      t.timestamps
    end
  end
end
