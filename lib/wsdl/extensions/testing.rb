module WSDL
  module Extensions
    module Testing
      extend ActiveSupport::Concern
      
      module InstanceMethods
        def test_sections
          if self.details[:hsr_trns_tst_vw].present?
            self.details[:hsr_trns_tst_vw]
          else
            []
          end
        end
      end
      
    end # Testing
  end # Extensions
end # WSDL