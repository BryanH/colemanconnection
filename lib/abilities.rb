module Abilities
  extend ActiveSupport::Concern
  
  included do
    def method_missing(meth, *args, &block)
      if meth.to_s =~ /^permission_(.+)$/
        self.class.module_eval do
          attr_accessor meth.to_sym
        end
      else
        super
      end
    end
  end
  
end