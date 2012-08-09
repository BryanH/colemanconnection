class Employee < User
  
  scope :active, lambda { |isactive| where(active: isactive) }
  
  def activate!
    self.active = true
    save!
  end
  
  def deactivate!
    self.active = false
    save!
  end
  
end
