class Snitches::CandidateSnitch < Snitches::BaseSnitch
  
  filter_attrs :updated_at, :created_at
  
  def for_updating_email
    "#{user.name} updated the following for #{model.name}: #{changed_attributes}"
  end
  
end