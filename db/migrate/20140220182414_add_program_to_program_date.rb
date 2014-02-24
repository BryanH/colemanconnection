class AddProgramToProgramDate < ActiveRecord::Migration
  def change
    add_column :program_dates, :program_id, :integer
    add_index :program_dates, :program_id
  end
end
