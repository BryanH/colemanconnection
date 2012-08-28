class AddUserIndexes < ActiveRecord::Migration
  def change
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :active
    add_index :users, :type
    add_index :users, :demographic_id
  end
end
