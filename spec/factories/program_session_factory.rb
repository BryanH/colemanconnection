FactoryBot.define do
  factory :program_session, class: Session do
    association :user, factory: :candidate
    program_date
  end
end
