class PopulatePathwaySettings < ActiveRecord::Migration
  def up
    {
      "Biosafety" => {
        url: "",
        tags: ""
      },

      "Certified Prevention Specialist" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/human_service_technology.html",
        tags: "blood takedirection peopleperson"
      },

      "Chemical Dependency Certificate (LCDC)" => {
        url: "",
        tags: ""
      },

      "Community Health Worker" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/human_service_technology.html",
        tags: "handson peopleperson"
      },

      "Computed Tomography" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/computed_tomography.html",
        tags: "tecky"
      },

      "Dental Assisting" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/dental_assisting.html",
        tags: "blood takedirection peopleperson"
      },

      "Dental Hygiene" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/dental_hygiene.html",
        tags: "blood takedirection peopleperson"
      },

      "Diagnostic Medical Sonography" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/diagnostic_medical_sonography.html",
        tags: "tecky"
      },

      "Grand Aide Medical Worker" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/medical_assistant.html",
        tags: ""
      },

      "Health Care Career Academy" => {
        url: "http://hcccolemancollege.org/hcca/",
        tags: ""
      },

      "Health Information Technology" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/health_information_technology.html",
        tags: "tecky"
      },

      "Histology Technician" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/histology.html",
        tags: "tecky loner"
      },

      "Human Service Technology" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/human_service_technology.html",
        tags: "handson peopleperson"
      },

      "Medical Assistant" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/medical_assistant.html",
        tags: "blood takedirection peopleperson"
      },

      "Medical Laboratory Technician" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/medical_laboratory_technician.html",
        tags: "blood takedirection peopleperson"
      },

      "Nuclear Medicine Technologist" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/nuclear_medicine_technology.html",
        tags: "tecky"
      },

      "Nursing (Registered Nursing)" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/associate_degree_nursing.html",
        tags: "blood lifeordeath peopleperson"
      },

      "Nursing (Vocational Nursing)" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/vocational_nursing.html",
        tags: "blood takedirection peopleperson"
      },

      "Occupational Therapy Assistant" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/occupational_therapy_assistant.html",
        tags: "handson peopleperson"
      },

      "Pharmacy Technician" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/pharmacy_technician.html",
        tags: "tecky"
      },

      "Physical Therapist Assistant" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/physical_therapist_assistant.html",
        tags: "handson peopleperson"
      },

      "Radiography" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/radiography.html",
        tags: "tecky"
      },

      "Respiratory Therapist" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/respiratory_therapy.html",
        tags: "blood lifeordeath peopleperson"
      },

      "Retail Pharmacy (MSA)" => {
        url: "",
        tags: ""
      },

      "Surgical Technology" => {
        url: "http://hcccolemancollege.org/thebook/program_pages/surgical_technology.html",
        tags: "blood takedirection peopleperson"
      },
    }.each_pair do |program_name, args|
      PathwaySetting.create!(program: Program.find_by_name(program_name), url: args[:url], tags: args[:tags])
    end
  end
end
