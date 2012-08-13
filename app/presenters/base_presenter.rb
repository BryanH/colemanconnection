class BasePresenter
  
  def initialize(object, template)
    @object = object
    @template = template
  end
  
  def self.presents(name)
    define_method(name) do
      @object
    end
  end
  
  def h
    @template
  end
  
private

  def handle_blank(value)
    if value.present?
      if block_given?
        yield
      else
        value
      end
    else
      h.raw('<span class="metadata">not available</span>')
    end
  end
  
end