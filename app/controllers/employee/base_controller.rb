class Employee::BaseController < ApplicationController
  before_filter :authorize_staff!

private

  def authorize_staff!
    authenticate_user!
    unless current_user.is_a?(Staff) and current_user.active?
      redirect_to root_path, flash: { alert: "You must be an HCC Coleman College employee to view that page" }
    end
  end
end
