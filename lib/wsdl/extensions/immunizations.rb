module WSDL
  module Extensions
    module Immunizations
      extend ActiveSupport::Concern
      
      module InstanceMethods
        
        def immunization
          self.details[:immunization] || "Not Available"
        end
        
        def immunization_date_taken
          self.details[:date_taken] || "Not Available"
        end
        
        def immunization_expiration_date
          self.details[:expiration_dt] || "Not Available"
        end
        
        def immunization_received
          self.details[:date_received] || "Not Available"
        end
        
      end
      
    end
  end
end