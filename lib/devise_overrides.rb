module DeviseOverrides
  def stored_location_for(resource_or_scope)
    nil
  end

  def after_sign_in_path_for(resource_or_scope)
    case 
    when current_user.is_a?(Candidate)
      raise "Candidate root path"
    when current_user.is_a?(Staff)
      raise "Employee root path"
    else
      raise "We aren't anything"
    end
  end
end
