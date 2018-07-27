# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
time = Time.now.to_s
progs = {
  "Biosafety" => :first_thursdays,
  "Certified Prevention Specialist" => :both,
  "Clinical Laboratory Technician" => :first_thursdays,
  "Community Health Worker" => :first_thursdays,
  "Computed Tomography" => :both,
  "Dental Assisting" => :third_thursdays,
  "Dental Hygiene" => :third_thursdays,
  "Diagnostic Medical Sonography" => :both,
  "Grand Aide Medical Worker" => :first_thursdays,
  "Health Care Career Academy" => [2, 5, 6, 9, 10, 13, 14, 17, 18, 21, 22],
  "Health Information Technology" => :both,
  "Histology Technician" => :first_thursdays,
  "Human Service Technology" => :first_thursdays,
  "Medical Assistant" => :first_thursdays,
  "Nuclear Medicine Technologist" => :both,
  "Nursing (Registered Nursing)" => :both,
  "Nursing (Vocational Nursing)" => :third_thursdays,
  "Occupational Therapy Assistant" => :third_thursdays,
  "Pharmacy Technician" => :both,
  'Retail Pharmacy (MSA)' => :both,
  "Physical Therapist Assistant" => [2, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 21, 22],
  "Radiography" => :both,
  "Respiratory Therapist" => :first_thursdays,
  "Surgical Technology" => [2, 5, 6, 9, 10, 13, 14, 17, 18, 21, 22],
  "Chemical Dependency Certificate (LCDC)" => :first_thursdays
}

progs.each_pair do |program_name, schedule|
  program = Program.create( name: program_name )
  if schedule.is_a?(Symbol)
    case schedule
    when :first_thursdays
#      ProgramSessionTimes.first_thursdays.each do |time|
 #       next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      #end
    when :third_thursdays
  #    ProgramSessionTimes.third_thursdays.each do |time|
   #     next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      #end
    when :both
    #  ProgramSessionTimes.all.each do |time|
     #   next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      #end
    end
  else
    schedule.each do |i|
 #####     time = ProgramSessionTimes::OCCURS_ON_TIMES[i]
     # next if ProgramSessionTimes.already_created?(time, program)
      ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
    end
  end
end
