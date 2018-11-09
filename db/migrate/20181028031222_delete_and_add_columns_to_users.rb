class DeleteAndAddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
      add_reference :users, :role, foreign_key: true
      #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
