class Snitches::EmployeeSnitch < Snitches::BaseSnitch
  
  filter_attrs :updated_at, :created_at, :password
  
  def for_updates
    "#{user.name} updated the following attributes for #{model == user ? 'themselves' : model.name}: #{changed_attributes}"
  end
  
  def for_activation
    "#{user.name} #{model.active? ? 'activated' : 'deactivated'} #{model.name}"
  end
  
  def for_creating
    "#{user.name} created a new user: #{model.name} ( #{model.email} )"
  end
  
end