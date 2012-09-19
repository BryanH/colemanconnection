class Snitches::PermissionSnitch < Snitches::BaseSnitch
  
  filter_attrs :updated_at, :created_at, :id
  
  def for_creating
    "#{user.name} permitted #{model.user.name} to #{model.action.humanize} on #{model.subject_class.titleize}"
  end
  
  def for_removing
    "#{user.name} removed permission for #{model.user.name} to #{model.action.humanize} on #{model.subject_class.titleize}"
  end
  
end