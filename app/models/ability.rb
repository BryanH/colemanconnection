class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :view, to: :read
    
    # Calling User.new will create a 'guest' user if one is not already set.
    user ||= User.new
    
    # Do not allow any abilities by default
    cannot :manage, :all
    
    # Loop through the permissions for a user and set what they are able to do.
    if user.kind_of?(Employee)
      user.permissions.each do |permission|
        if permission.subject_class.downcase == 'all'
          can permission.action.to_sym, :all
        else
          can permission.action.to_sym, permission.subject_class.constantize
        end
      end
      
      # Employees should be able to edit their own account information
      can [:read, :view, :edit, :update], Employee, id: user.id
    else
      can [:read, :update, :destroy], Candidate, id: user.id
    end
    
    # Do not allow employees to change their own permissions.
    cannot :set_permissions, Employee, id: user.id
    
    # Do not allow employees to deactivate themselves
    cannot :change_active_status, Employee, id: user.id
  end
end
