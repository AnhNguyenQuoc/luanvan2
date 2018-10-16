class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.string :description, default: ""
      t.integer :rating, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :restaurant,index: true, foreign_key: true

      t.timestamps
    end
  end
end
