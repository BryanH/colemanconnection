class Snitches::AttendanceSnitch < Snitches::BaseSnitch
  
  def for_marking_attendance
    "#{user.name} marked #{model.user.name} as #{model.attended? ? 'attended' : 'not attended'}"
  end
  
end