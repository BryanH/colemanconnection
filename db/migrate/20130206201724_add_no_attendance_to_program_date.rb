class AddNoAttendanceToProgramDate < ActiveRecord::Migration
  def change
    add_column :program_dates, :no_attendance, :boolean, default: false
  end
end
