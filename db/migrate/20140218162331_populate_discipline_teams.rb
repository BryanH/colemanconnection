class PopulateDisciplineTeams < ActiveRecord::Migration
  def up
    {
      'Nursing' => '#4f0b7b',
      'Patient Care Services' => '#b634bb',
      'Therapeutic Services' => '#00c473',
      'Diagnostic Services' => '#6aade4',
      'Health Care & Admin' => '#ec7a08',
      'Dental Services' => '#c4262e'
    }.each_pair do |k,v|
      DisciplineTeam.create!(name: k, color: v)
    end
  end
end
