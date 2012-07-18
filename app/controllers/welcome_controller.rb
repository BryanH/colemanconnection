class WelcomeController < ApplicationController
  
  def index
  end
  
  def pathway
  end
  
  def quiz
    render partial: "welcome/quiz/#{params[:id]}"
  end
  
end