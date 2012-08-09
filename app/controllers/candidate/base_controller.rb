class Candidate::BaseController < ApplicationController
  before_filter :authorize_candidate!

private
  
  def authorize_candidate!
    authenticate_user!
    unless current_user.is_a?(Candidate) and current_user.active?
      redirect_to root_path, flash: { alert: "You must have a valid account in order to view that page" }
    end
  end
end
