class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.belongs_to :discipline_team

      t.timestamps
    end
    add_index :programs, :discipline_team_id
  end
end
