class RenameProgramToProgramStringForProgramDate < ActiveRecord::Migration
  def change
    rename_column :program_dates, :program, :program_string
  end
end
