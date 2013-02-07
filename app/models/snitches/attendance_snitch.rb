class Snitches::AttendanceSnitch < Snitches::BaseSnitch
  
  def for_marking_attendance
    "#{user.name} marked #{model.user.name} as #{model.attended? ? 'attended' : 'not attended'}"
  end
  
  def for_marking_program_attendance
    "#{user.name} #{model.no_attendance? ? 'checked' : 'unchecked'} the 'No candidates attended this sesion'"
  end
  
end