class ProgramSelectOptions
  
  def self.names(subject_class = Program)
    subject_class.order(:name).select(:name).map {|p| [p.id, p.name]}
  end
  
end