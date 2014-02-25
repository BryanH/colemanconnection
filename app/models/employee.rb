class Employee < User
  
  include Abilities
  
  scope :active, lambda { |isactive| where(active: isactive) }
  
  audit(:update, only: [:first_name, :last_name, :email]) { |employee, user, action| employee.snitches_on(user).for_updates }
  audit(:update, only: :active) { |employee, user, action| employee.snitches_on(user).for_activation }
  audit(:create, only: [:first_name, :last_name, :email]) { |employee, user, action| employee.snitches_on(user).for_creating } unless self.count.zero?
  
  delegate :can?, :cannot?, :is_able_to,  to: :ability
  
  alias :is_able_to :can?
  
  def ability
    @ability ||= Ability.new(self)
  end
  
  def reset_ability!
    @ability = nil
    self.reload
  end
  
  def activate!
    self.active = true
    self.password = 'coleman123'
    save!
  end
  
  def deactivate!
    self.active = false
    save!
    self.permissions.destroy_all
  end
  
  def snitches_on(user)
    Snitches::EmployeeSnitch.new(self, user)
  end
  
  def can_view_reports?
    self.permissions.where{ subject_class.eq("All") & action.not_eq('audit') }.count > 0
  end
  
  def can_view_system_settings?
    self.permissions.where{ subject_class.eq("All") }.count > 0
  end
  
end
