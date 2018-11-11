class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string 'code'
      t.integer 'amount', default: 0
      t.date 'expiration'
      t.timestamps
    end
  end
end
