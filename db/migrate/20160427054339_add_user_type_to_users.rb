class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :integer
    remove_column :users, :is_admin, :boolean
  end
end
