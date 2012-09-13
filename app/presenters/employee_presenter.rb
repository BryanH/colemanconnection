class EmployeePresenter < BasePresenter
  presents :employee 
  
  def list_name
    h.raw "#{employee.reversed_name} <small class='metadata'>( #{employee.email} )</small>"
  end
  
  def activation_link
    if h.current_user.can?(:change_active_status, employee)
      h.content_tag :span, class: 'label label-link' do
        h.link_to 'activate', h.employee_activations_path(id: employee.id), method: :post
      end
    end
  end
  
  def permissions_link
    if h.current_user.can?(:set_permissions, employee)
      h.content_tag :span, class: 'label label-link' do
        h.link_to 'permissions', h.employee_permission_path(employee.id)
      end
    end
  end
  
  def account_settings_link
    if h.current_user.can?(:edit_account_settings, employee)
      h.content_tag :span, class: 'label label-link' do
        h.link_to 'account settings', h.edit_employee_user_path(employee)
      end
    end
  end
  
  def deactivation_link
    if h.current_user.can?(:change_active_status, employee)
      h.content_tag :span, class: 'label label-important label-link' do
        h.link_to 'deactivate', h.employee_activation_path(employee), method: :delete,
        confirm: 'Once deactivated, the user will no longer be able to access the system.',
        data: { confirm_title: 'Are you sure?', confirm_proceed: 'Deactivate' }
      end
    end
  end
  
end