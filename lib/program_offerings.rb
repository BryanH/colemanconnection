class ProgramOfferings
  
  def self.all
    [
      'Patient Care Services' => {
          'Nursing (Registered Nursing)' => { :color => '#4f0b7b'},
          'Nursing (Vocational Nursing)' => { :color => '#4f0b7b'},
          'Medical Assistant' => { :color => '#b634bb'},
          'Surgical Technology' => { :color => '#b634bb'},
          'Health Care Career Academy' => {:color => '#b634bb'},
          'Grand Aide Medical Worker' => {:color => '#b634bb'}
        },
      'Therapeutic Services' => {
          'Occupational Therapy Assistant' => { :color => '#00c473'},
          'Physical Therapist Assistant' => { :color => '#00c473'},
          'Respiratory Therapist' => { :color => '#00c473'}
        },
      'Diagnostic Services' => {
          'Medical Laboratory Technician' => { :color => '#6aade4'},
          'Computed Tomography' => { :color => '#6aade4'},
          'Diagnostic Medical Sonography' => { :color => '#6aade4'},
          'Histology Technician' => { :color => '#6aade4'},
          'Nuclear Medicine Technologist' => { :color => '#6aade4'},
          'Radiography' => { :color => '#6aade4'},
          'Biosafety' => {:color => '#6aade4'}
        },
      'Health Care & Admin' => {
          'Health Information Technology' => { :color => '#ec7a08'},
          'Human Service Technology' => { :color => '#ec7a08'},
          'Pharmacy Technician' => { :color => '#ec7a08'},
          'Retail Pharmacy (MSA)' => { :color => '#ec7a08'},
          'Certified Prevention Specialist' => {:color => '#ec7a08'},
          'Community Health Worker' => {:color => '#ec7a08'},
          'Chemical Dependency Certificate (LCDC)' => {:color => '#ec7a08'}
        },
      'Dental Services' => {
          'Dental Assisting' => { :color => '#c4262e'},
          'Dental Hygiene' => { :color => '#c4262e'}
        },
      'Other' => {
        }
    ]
  end
  
  def self.discipline_teams
    all.map(&:keys).flatten.sort
  end
  
  def self.programs(include_colors=false)
    include_colors ?
      all.map(&:values).flatten.inject { |x, y| x.merge(y) } :
      all.map(&:values).flatten.map(&:keys).flatten.sort
  end
end