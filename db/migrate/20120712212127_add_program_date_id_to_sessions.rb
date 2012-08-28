class AddProgramDateIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :program_date_id, :integer
  end
end
