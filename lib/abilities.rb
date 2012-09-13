module Abilities
  extend ActiveSupport::Concern
  
  included do
    attr_accessor :permission_employee_can_view, :permission_employee_can_edit
  end
  
end