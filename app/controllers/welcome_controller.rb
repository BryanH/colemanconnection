class WelcomeController < ApplicationController
  
  def index
    if user_signed_in?
      redirect_to root_path_for(current_user)
    end
  end
  
  def pathway
  end
  
  def quiz
    render partial: "welcome/quiz/#{params[:id]}"
  end
  
end