class Employee::BaseController < ApplicationController
  before_action :authorize_employee!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to employee_root_path, flash: { error: "You do not have permission to do that." }
  end

private

  def authorize_employee!
    authenticate_user!
    unless current_user.is_a?(Employee) and current_user.active?
      redirect_to root_path, flash: { alert: "You must be an HCC Coleman College employee to view that page" }
    end
  end
end
