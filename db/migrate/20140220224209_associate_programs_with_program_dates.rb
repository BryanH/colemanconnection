class AssociateProgramsWithProgramDates < ActiveRecord::Migration
  def up
    ProgramDate.transaction do
      ProgramDate.find_each do |program_date|
        program_str = program_date.program_string == "Clinical Laboratory Technician" ? "Medical Laboratory Technician" : program_date.program_string
        program_date.program_id = Program.find_by_name(program_str).id
        begin
          program_date.save!
        rescue
          puts program_date.inspect
        end
      end
    end
  end
end