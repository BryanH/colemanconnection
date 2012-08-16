class Candidate < User
  
  audit(:update, only: :email) { |candidate, user, action| candidate.snitches_on(user).for_updating_email }
  
  def snitches_on(user)
    Snitches::CandidateSnitch.new(self, user)
  end
  
end