class SessionPresenter < BasePresenter
  presents :session
  delegate :program, :occurs_on, to: :program_date, prefix: true
  
  def occurs_on
    session.program_date_occurs_on.to_formatted_s(:pretty)
  end
  
  def attended?
    h.raw('<i class="icon-ok"></i>') if session.attended?
  end
end