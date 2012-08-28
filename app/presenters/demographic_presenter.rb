class DemographicPresenter < BasePresenter
  presents :demographic
  wraps_attrs :gender, :age_group, :address, :city, :state, :zip, :home_phone,
              :mobile_phone, :hcc_student_id, :current_hcc_college,
              :hcc_email_address, :hcc_referral_source, :other_advisor_college,
              :first_program_choice, :second_program_choice, :preferred_start_date
end