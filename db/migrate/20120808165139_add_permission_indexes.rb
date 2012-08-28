class AddPermissionIndexes < ActiveRecord::Migration
  def change
    add_index :permissions, :user_id
  end
end
