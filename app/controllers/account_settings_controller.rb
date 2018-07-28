class AccountSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_section!, only: :edit

  def edit
    @demographic = current_user.demographic || current_user.build_demographic
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to edit_account_settings_path(params[:section]), notice: "Successfully updated #{params[:section]} settings"
    else
      render :edit
    end
  end

private

  def validate_section!
    redirect_to edit_account_settings_path(:account), alert: 'That is not a valid setting option' unless %w[account password demographics hcc coleman].include?(params[:section])
  end
end
