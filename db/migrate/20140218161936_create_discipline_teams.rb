class CreateDisciplineTeams < ActiveRecord::Migration
  def change
    create_table :discipline_teams do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
