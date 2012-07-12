module ApplicationHelper

  def root_path_for(user)
    user.is_a?(Staff) ? staff_root_path : students_root_path
  end

end
