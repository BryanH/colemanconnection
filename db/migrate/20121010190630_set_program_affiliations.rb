class SetProgramAffiliations < ActiveRecord::Migration
  def up
    Employee.find_each do |employee|
      employee.program_affiliations = ProgramOfferings.programs
      employee.save!
    end
  end
end
