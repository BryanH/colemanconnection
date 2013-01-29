class SurveyResultsController < ApplicationController
  
  before_filter :set_survey_result, only: [:show, :edit, :update]
  
  def index
    @survey_token ||= params[:survey_token]
    @survey_result = nil
    
    if SurveyResult.exists?(token: @survey_token)
      @survey_result ||= SurveyResult.find_by_token(@survey_token)
      if @survey_result.comment.present?
        redirect_to survey_result_path(@survey_result.token)
      else
        @survey_result.update_attributes!(result: params[:survey_response]) if @survey_result.result == 'pending'
        redirect_to edit_survey_result_path(@survey_result.token) and return
      end
    else
      redirect_to root_path
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @survey_result.update_attributes(params[:survey_result])
      redirect_to survey_result_path(@survey_result.token)
    else
      render :edit
    end
  end

private
  
  def set_survey_result
    @survey_result ||= SurveyResult.find_by_token(params[:id])
  end
  
end