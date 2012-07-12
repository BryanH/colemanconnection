module DeviseOverrides
  def stored_location_for(resource_or_scope)
    nil
  end

  def after_sign_in_path_for(resource_or_scope)
    case 
    when current_user.is_a?(Student)
      raise "Student root path"
    when current_user.is_a?(Staff)
      raise "Staff root path"
    else
      raise "We aren't anything"
    end
  end
end
