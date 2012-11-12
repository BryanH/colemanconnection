module Abilities
  extend ActiveSupport::Concern
  
  included do
    attr_accessor :permission_employee_can_view, :permission_employee_can_edit,
                  :permission_employee_can_change_active_status,
                  :permission_employee_can_set_permissions,
                  :permission_employee_can_create, :permission_employee_can_view_audits,
                  :permission_program_date_view, :permission_session_mark_attendance,
                  :permission_candidate_can_view, :permission_candidate_can_edit,
                  :permission_candidate_can_view_peoplesoft, :permission_employee_can_view_happiness_report
  end
  
end