module WSDL
  module Extensions
    module Transcripts
      extend ActiveSupport::Concern
      
      module InstanceMethods
        def internal_transcripts
          if self.details[:hss_enrvw_hs].present?
            self.details[:hss_enrvw_hs]
          else
            []
          end
        end
      
        def external_transcripts
          if self.details[:hsr_trnscrse_vw].present?
            self.details[:hsr_trnscrse_vw]
          else
            []
          end
        end
      end
      
    end # Transcripts
  end # Extensions
end # WSDL