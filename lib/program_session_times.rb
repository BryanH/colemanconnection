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