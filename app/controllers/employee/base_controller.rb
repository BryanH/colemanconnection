class Employee::BaseController < ApplicationController
  before_filter :authorize_employee!

private

  def authorize_employee!
    authenticate_user!
    unless current_user.is_a?(Employee) and current_user.active?
      redirect_to root_path, flash: { alert: "You must be an HCC Coleman College employee to view that page" }
    end
  end
end
