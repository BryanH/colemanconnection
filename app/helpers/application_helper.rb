module ApplicationHelper

  def root_path_for(user)
    user.is_a?(Staff) ? staff_root_path : students_root_path
  end
  
  def additional_styles(*styles)
    content_for :additional_styles do
      raw(styles.map { |s| stylesheet_link_tag(s) }.join("\n"))
    end
  end
  
  def additional_js(*javascripts)
    content_for :additional_js do
      raw(javascripts.map { |j| javascript_include_tag(j) }.join("\n"))
    end
  end

end
