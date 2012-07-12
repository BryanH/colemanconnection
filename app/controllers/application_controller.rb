class ApplicationController < ActionController::Base
  protect_from_forgery

private
  
  def store_location_for(resource_or_scope)
    nil
  end

  def after_sign_in_path_for(resource_or_scope)
    case
    when current_user.is_a?(Staff)
      staff_root_path
    when current_user.is_a?(Student)
      students_root_path
    else
      root_path
    end
  end
end

