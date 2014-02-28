class Employee::PathwaySettingsController < Employee::BaseController
  
  def index
    @programs = Program.order(:name).where(active: true).paginate(page: params[:page])
  end
  
  def edit
    @pathway_setting = PathwaySetting.find(params[:id])
  end
  
  def update
    params[:pathway_setting][:tags] = params[:pathway_setting][:tags].compact.reject(&:empty?).join(' ')
    @pathway_setting = PathwaySetting.find(params[:id])
    if @pathway_setting.update_attributes(params[:pathway_setting])
      redirect_to [:employee, :pathway_settings], notice: "Settings were updated successfully."
    else
      render :edit
    end
  end
  
end