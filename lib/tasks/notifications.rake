namespace :notifications do
  desc "Send New Features Email to Employees"
  task new_features: :environment do
    Employee.active(true).each do |employee|
      Announcements.delay.new_features(employee) rescue next
    end
  end
  
  desc "Send attendees of program sessions a satifactions survey"
  task program_session_survey: :environment do
    # 1. get the program dates for the previous week
    # 2. loop through each of the candidates that attended
    #   2a. Create a survey result with a unique token
    #   2b. call the Notifications.satisfaction_survey with [:candidate, :program_date, :token]
    ProgramDate.includes(sessions: :user).where{ date(occurs_on).in week_start(1.week.ago)..week_end(1.week.ago) }.each do |program_date|
      program_date.sessions.attended(true).each do |session|
        recipient = session.user
        program_session = program_date
        survey_result = program_session.survey_results.create!(token: SurveyResult.generate_token, result: 'pending')
        Notifications.delay.satisfaction_survey(recipient, program_session, survey_result.token)
      end
    end
  end
  
  desc "Send reminder emails to Program Session registrants"
  task session_reminder: :environment do
    ProgramDate.includes(sessions: :user).where{ date(occurs_on).in week_start..week_end }.each do |program_date|
      program_date.sessions.each do |session|
        Notifications.delay.session_reminder(session.user, program_date)
      end
    end
  end
  
private
  
  def week_start(date = Date.today)
    date.beginning_of_week
  end
  
  def week_end(date = Date.today)
    date.end_of_week
  end
end