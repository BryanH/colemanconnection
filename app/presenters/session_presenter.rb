class SessionPresenter < BasePresenter
  presents :session 
  
  def program
    session.program_date.program
  end
  
  def occurs_on
    session.program_date.occurs_on.to_formatted_s(:pretty)
  end
  
  def attended?
    h.raw('<i class="icon-ok"></i>') if session.attended?
  end
end