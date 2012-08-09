class ChangeStaffToEmployee < ActiveRecord::Migration
  def up
    User.where(type: 'Staff').update_all(type: 'Employee')
  end

  def down
    User.where(type: 'Employee').update_all(type: 'Staff')
  end
end
