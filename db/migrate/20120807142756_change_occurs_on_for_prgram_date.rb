class ChangeOccursOnForPrgramDate < ActiveRecord::Migration
  def up
    change_table :program_dates do |t|
      t.change :occurs_on, :datetime
    end
  end

  def down
    change_table :program_dates do |t|
      t.change :occurs_on, :date
    end
  end
end
