# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class ProgramSessionTimes

  # Program Session Dates
  OCCURS_ON_TIMES = [
    nil,                           # 0
    "September 20th at noon",      # 1
    "October 4th at 5:30pm",       # 2
    "October 18th at noon",        # 3
    "November 1st at 5:30pm",      # 4
    "November 15th at noon",       # 5
    "December 6th at 5:30pm",      # 6
    nil,                           # 7
    "January 3rd 2013 at 5:30pm",  # 8
    "January 17th 2013 at noon",   # 9
    "February 7th 2013 at 5:30pm", # 10
    "February 21st 2013 at noon",  # 11
    "March 7th 2013 at 5:30pm",    # 12
    "March 21st 2013 at noon",     # 13
    "April 4th 2013 at 5:30pm",    # 14
    "April 18th 2013 at noon",     # 15
    "May 2nd 2013 at 5:30pm",      # 16
    "May 16th 2013 at noon",       # 17
    "June 6th 2013 at 5:30pm",     # 18
    "June 20th 2013 at noon",      # 19
    nil,                           # 20
    "July 18th 2013 at noon",      # 21
    "August 1st 2013 at 5:30pm",   # 22
    "August 15th 2013 at noon"     # 23
  ]
  
  def self.all
    OCCURS_ON_TIMES.compact
  end
  
  def self.first_thursdays
    OCCURS_ON_TIMES.in_groups_of(2).collect { |x| x[0] }.compact
  end
  
  def self.third_thursdays
     OCCURS_ON_TIMES.in_groups_of(2).collect { |x| x[1] }.compact
  end
  
  def self.already_created?(time, program)
    time = Chronic.parse(time)
    ProgramDate.exists?(occurs_on: time, program: program)
  end
  
end

{
  "Biosafety" => :first_thursdays,
  "Certified Prevention Specialist" => :both,
  "Clinical Laboratory Technician" => :first_thursdays,
  "Community Health Worker" => :both,
  "Computed Tomography" => :both,
  "Dental Assisting" => :third_thursdays,
  "Dental Hygiene" => :third_thursdays,
  "Diagnostic Medical Sonography" => :both,
  "Grand Aide Medical Worker" => :first_thursdays,
  "Health Care Career Academy" => [2, 5, 6, 9, 10, 13, 14, 17, 18, 21, 22],
  "Health Information Technology" => :both,
  "Histology Technician" => :first_thursdays,
  "Human Service Technology" => :both,
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
  "Surgical Technology" => [2, 5, 6, 9, 10, 13, 14, 17, 18, 21, 22]
}.each_pair do |program, schedule|
  if schedule.is_a?(Symbol)
    case schedule
    when :first_thursdays
      ProgramSessionTimes.first_thursdays.each do |time|
        next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      end
    when :third_thursdays
      ProgramSessionTimes.third_thursdays.each do |time|
        next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      end
    when :both
      ProgramSessionTimes.all.each do |time|
        next if ProgramSessionTimes.already_created?(time, program)
        ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
      end
    end
  else
    schedule.each do |i|
      time = ProgramSessionTimes::OCCURS_ON_TIMES[i]
      next if ProgramSessionTimes.already_created?(time, program)
      ProgramDate.create!(program: program, occurs_on: Chronic.parse(time))
    end
  end
end