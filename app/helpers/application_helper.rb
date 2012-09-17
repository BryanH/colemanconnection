module ApplicationHelper
  
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
  
  def present(object, klass = nil, &block)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
  
  def link_to_help_me(tour)
    link_to 'Find out how to use this page', '#', data: { help_me: tour } if tour
  end

end
