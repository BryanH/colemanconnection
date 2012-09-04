module WSDL
  module Extensions
    module Military
      extend ActiveSupport::Concern
      
      STATUSES = {
        '1' => 'Not indicated',
        '2' => 'No military service',
        '3' => 'Veteran of the Vietnam Era',
        '4' => 'Other Protected Veteran',
        '5' => 'Active Reserve',
        '6' => 'Inactive Reserve',
        '7' => 'Retired Military',
        '8' => 'Active Duty',
        '9' => 'Texas Veteran',
        'A' => 'Armed Forces Service Medal Veteran',
        'B' => 'Pre-Vietnam-Era Veteran',
        'N' => 'Not a Vietnam-Era Veteran',
        'O' => 'Service Medal &amp; Other Veteran',
        'P' => 'Post-Vietnam-Era Veteran',
        'V' => 'Vietnam-Era Veteran',
        'X' => 'Not a Veteran'
      }
      
      AFFILIATES = {
        '1' => 'Current or Former Member of the US Armed Forces',
        '2' => 'Current or Former Member of the National Guard',
        '3' => 'Current or former Member of the Reserves',
        '4' => 'Dependent of a Veteran'
      }
      
      module InstanceMethods
        def military_status
          if self.details[:military_status].present?
            STATUSES[self.details[:military_status].to_s]
          else
            nil
          end
        end
        
        def affiliation
          if self.details[:had_mil_affil].present?
            AFFILIATES[self.details[:had_mil_affil].to_s]
          else
            nil
          end
        end
      end
      
    end # MilitaryStatus
  end # Extensions
end # WSDL