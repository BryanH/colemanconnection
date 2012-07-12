class Students::BaseController < ApplicationController
  before_filter :authorize_student!

private
  
  def authorize_student!
    authenticate_user!
    unless current_user.is_a?(Student) and current_user.active?
      redirect_to root_path, flash: { alert: "You must have a valid account in order to view that page" }
    end
  end
end
