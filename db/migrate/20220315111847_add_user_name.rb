class AddUserName < ActiveRecord::Migration[6.1]
  def change

    add_column :users, :first_name, :string, :limit => 25, :after => "id"
    add_column :users, :last_name, :string, :limit => 25, :after => "first_name"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")

  end
end
