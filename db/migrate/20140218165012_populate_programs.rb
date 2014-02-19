class PopulatePrograms < ActiveRecord::Migration
  def up
    {
      'Nursing' => ['Nursing (Registered Nursing)', 'Nursing (Vocational Nursing)'],
      'Patient Care Services' => ['Medical Assistant', 'Surgical Technology', 'Health Care Career Academy', 'Grand Aide Medical Worker'],
      'Therapeutic Services' => ['Occupational Therapy Assistant', 'Physical Therapist Assistant', 'Respiratory Therapist'],
      'Diagnostic Services' => ['Medical Laboratory Technician', 'Computed Tomography', 'Diagnostic Medical Sonography', 'Histology Technician', 'Nuclear Medicine Technologist', 'Radiography'],
      'Health Care & Admin' => ['Health Information Technology', 'Human Service Technology', 'Pharmacy Technician', 'Retail Pharmacy (MSA)', 'Certified Prevention Specialist', 'Community Health Worker', 'Chemical Dependency Certificate (LCDC)'],
      'Dental Services' => ['Dental Assisting', 'Dental Hygiene']
    }.each_pair do |discipline_team, programs|
      programs.each do |name|
        prog = Program.new name: name
        prog.discipline_team_id = DisciplineTeam.where(name: discipline_team).select(:id).first.id
        prog.save!
      end
    end
  end
end
