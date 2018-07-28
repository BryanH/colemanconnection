# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  demographic_id         :integer
#  role_mask              :integer
#  first_name             :string(255)
#  last_name              :string(255)
#  active                 :boolean          default(TRUE)
#  type                   :string(255)
#  username               :string(255)
#  program_affiliations   :text
#

FactoryBot.define do
  factory :user do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.first_name }
    sequence(:email)  { |n| Faker::Internet.email("user#{n}") }
    password          { Faker.letterify '????????????' }

    factory :staff, aliases: [:employee], class: Employee do
      type "Employee"

      trait :who_can_set_permissions do
        after(:create) do |instance|
          instance.permissions.create!(action: 'set_permissions', subject_class: 'Employee')
        end
      end

      trait :overlord do
        after(:create) do |instance|
          instance.permissions.create!(action: 'manage', subject_class: 'all')
        end
      end
    end

    factory :student, aliases: [:candidate], class: Candidate do
      type "Candidate"
    end

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
