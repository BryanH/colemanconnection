class Employee < User
  
  scope :active, lambda { |isactive| where(active: isactive) }
  scope :search, lambda { |query| where{first_name.matches("%#{query}%") | 
                                        last_name.matches("%#{query}%") |
                                        email.matches("%#{query}%") }}
  
  def activate!
    self.active = true
    save!
  end
  
  def deactivate!
    self.active = false
    save!
  end
  
end
