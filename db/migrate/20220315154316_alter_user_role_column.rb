class AlterUserRoleColumn < ActiveRecord::Migration[6.1]
  def change
      change_column :users, :role, :string, :default => 'student', :limit=> 25
      #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
