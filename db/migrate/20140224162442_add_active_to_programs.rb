class AddActiveToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :active, :boolean, default: true
  end
end
