class BasePresenter
  
  def initialize(object, template)
    @object = object
    @template = template
  end
  
  # Creates a named method for the @object
  #
  # name - A symbol that will be used to define a method for the @object
  #
  # Example
  #
  #   presents :user
  #   
  #   # equivalent to
  #
  #   def user
  #     @object
  #   end
  #
  # Returns an object
  def self.presents(name)
    define_method(name) do
      @object
    end
  end
  
  # Creates a dynamic method that wraps the corresponding method on the
  # <object> in a #handle_blank block.
  #
  # Example
  #
  #   wraps_attrs :gender
  #
  #   # Is equivalent to writing
  #
  #   def gender
  #     handle_blank @object.gender
  #   end
  #
  # Returns a string
  def self.wraps_attrs(*args)
    args.each do |meth|
      define_method(meth) do
        handle_blank(@object.send(meth))
      end
    end
  end
  
  # Convenience accessor method for the @template object
  #
  # Returns a view context object
  def h
    @template
  end
  
private
  
  # Private: Returns a default message if the passed <value> is blank.
  #
  # value - A value that will checked for blank?
  # block - (optional) The result of calling the block will be used as the
  #         returned value
  #
  # Examples
  #
  #   handle_blank ''
  #   #=> '<span class="metadata">not available</span>'
  #
  #   handle_blank '' do
  #     "This should not be seen"
  #   end
  #   #=> '<span class="metadata">not available</span>'
  #
  #   handle_blank 42
  #   #=> '42'
  #
  #   handle_blank 42 do
  #     "the meaning of life"
  #   end
  #   #=> "the meaning of life"
  #
  # Returns a string
  def handle_blank(value)
    if value.present?
      if block_given?
        yield
      else
        value.to_s
      end
    else
      h.raw('<span class="metadata">not available</span>')
    end
  end
  
end