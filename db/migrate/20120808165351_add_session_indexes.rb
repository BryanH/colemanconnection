class AddSessionIndexes < ActiveRecord::Migration
  def change
    add_index :sessions, :er_date_id
    add_index :sessions, :program_date_id
    add_index :sessions, :user_id
  end
end
