class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.string :result, blank: false, null: false
      t.text :comment
      t.string :token, blank: false, null: false
      t.belongs_to :program_date

      t.timestamps
    end
    add_index :survey_results, :program_date_id
    add_index :survey_results, :token, unique: true
  end
end
