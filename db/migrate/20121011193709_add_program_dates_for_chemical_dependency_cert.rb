class AddProgramDatesForChemicalDependencyCert < ActiveRecord::Migration
  def up
    program = 'Chemical Dependency Certificate (LCDC)'
    ProgramSessionTimes.first_thursdays.each do |time|
      next if ProgramSessionTimes.already_created?(time, program)
      ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
    end
  end

  def down
  end
end
