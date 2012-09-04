module WSDL
  module Extensions
    module Citizenship
      extend ActiveSupport::Concern
      
      STATUSES = {
        '1' => 'Native',
        '2' => 'Naturalized',
        '3' => 'Alien Permanent',
        '4' => 'Alien Temporary',
        '5' => 'Permanent Resident',
        '6' => 'Employment Visa',
        '7' => 'Canadian Citizen',
        '8' => 'Other',
        'N' => 'Not indicated'
      }
      
      module InstanceMethods
        def citizenship
          if self.details[:citizenship_status].present?
            STATUSES[self.details[:citizenship_status].to_s]
          else
            nil
          end
        end
      end
      
    end # Citizenship
  end # Extensions
end # WSDL