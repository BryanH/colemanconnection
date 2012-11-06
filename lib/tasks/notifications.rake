namespace :notifications do
  desc "Send New Features Email to Employees"
  task new_features: :environment do
    Employee.active(true).each do |employee|
      Announcements.new_features(employee).deliver rescue next
    end
  end
  
  desc "Send attendees of program sessions a satifactions survey"
  task program_session_survey: :environment do
    # 1. get the program dates for the previous week
    # 2. loop through each of the candidates that attended
    #   2a. Create a survey result with a unique token
    #   2b. call the Notifications.satisfaction_survey with [:candidate, :program_date, :token]
    week = 1.week.ago
    beginning = week.beginning_of_week.to_date
    ending = week.end_of_week.to_date
    ProgramDate.includes(sessions: :user).where{ date(occurs_on).in beginning..ending }.each do |program_date|
      program_date.sessions.attended(true).each do |session|
        recipient = session.user
        program_session = program_date
        survey_result = program_session.survey_results.create!(token: SurveyResult.generate_token, result: 'pending')
        Notifications.satisfaction_survey(recipient, program_session, survey_result.token).deliver
      end
    end
  end
end