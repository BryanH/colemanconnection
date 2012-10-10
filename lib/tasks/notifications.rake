namespace :notifications do
  desc "Send New Features Email to Employees"
  task new_features: :environment do
    Employee.active(true).each do |employee|
      Announcements.new_features(employee).deliver rescue next
    end
  end
end