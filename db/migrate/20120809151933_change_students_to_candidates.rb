class ChangeStudentsToCandidates < ActiveRecord::Migration
  def up
    User.where(type: 'Student').update_all(type: 'Candidate')
  end

  def down
    User.where(type: 'Candidate').update_all(type: 'Student')
  end
end
