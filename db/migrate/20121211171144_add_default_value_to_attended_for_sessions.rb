class AddDefaultValueToAttendedForSessions < ActiveRecord::Migration
  include Auditor::Status
  
  def up
    change_column :sessions, :attended, :boolean, default: false
    
    without_auditing do
      Session.where(attended: nil).each do |s|
        s.attended = false
        s.save!
      end
    end
  end
end
