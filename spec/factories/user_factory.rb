# == Schema Information
#
# Table name: users
#
#  active                 :boolean          default(TRUE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  demographic_id         :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  first_name             :string(255)
#  id                     :integer          not null, primary key
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role_mask              :integer
#  sign_in_count          :integer          default(0)
#  type                   :string(255)
#  updated_at             :datetime
#

FactoryGirl.define do
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
