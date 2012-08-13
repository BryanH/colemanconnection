class ApplicationController < ActionController::Base
  protect_from_forgery

private
  
  def store_location_for(resource_or_scope)
    nil
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path_for(current_user)
  end
  
  def root_path_for(user)
    case
    when user.is_a?(Employee)
      employee_root_path
    when user.is_a?(Candidate)
      candidate_root_path
    else
      root_path
    end
  end
  helper_method :root_path_for
  
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
  
end

