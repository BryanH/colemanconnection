class CreatePathwaySettings < ActiveRecord::Migration
  def change
    create_table :pathway_settings do |t|
      t.belongs_to :program
      t.string     :url
      t.string     :tags
      
      t.timestamps
    end
    add_index :pathway_settings, :program_id
  end
end
