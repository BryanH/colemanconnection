class ChangeClinicalLaboratoryTechToMedicalLaboratoryTech < ActiveRecord::Migration
  def up
    ProgramDate.find_each(conditions: { program: 'Clinical Laboratory Technician' }) do |program_date|
      program_date.program = 'Medical Laboratory Technician'
      program_date.save!
    end
    
    Employee.find_each(conditions: ['program_affiliations LIKE ?', "%Clinical Lab%"]) do |employee|
      employee.program_affiliations = employee.program_affiliations.gsub('Clinical Lab', 'Medical Lab')
      employee.save!
    end
  end

  def down
    ProgramDate.find_each(conditions: { program: 'Medical Laboratory Technician' }) do |program_date|
      program_date.program = 'Clinical Laboratory Technician'
      program_date.save!
    end
    
    Employee.find_each(conditions: ['program_affiliations LIKE ?', "%Medical Lab%"]) do |employee|
      employee.program_affiliations = employee.program_affiliations.gsub('Medical Lab', 'Clinical Lab')
      employee.save!
    end
  end
end
