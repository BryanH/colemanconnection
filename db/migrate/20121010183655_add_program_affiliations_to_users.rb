class AddProgramAffiliationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :program_affiliations, :text
  end
end
