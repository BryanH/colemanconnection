class CreateProgramDates < ActiveRecord::Migration
  def change
    create_table :program_dates do |t|
      t.string  :program
      t.date    :occurs_on
      t.timestamps
    end

    add_index :program_dates, :program
    add_index :program_dates, :occurs_on
  end
end
