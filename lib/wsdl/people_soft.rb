require_relative 'extensions/citizenship'
require_relative 'extensions/military'
require_relative 'extensions/testing'
require_relative 'extensions/transcripts'

module WSDL
  class PeopleSoft
    extend Savon::Model
    
    include WSDL::Extensions::Citizenship
    include WSDL::Extensions::Military
    include WSDL::Extensions::Testing
    include WSDL::Extensions::Transcripts
    include WSDL::Extensions::Demographics
    include WSDL::Extensions::Immunizations
    
    attr_accessor :details, :emplid

    client wsdl: "https://pscsigwbn.hccs.edu:8080/PSIGW/PeopleSoftServiceListeningConnector/CI_HSS_COLEMAN.1.wsdl"
    client ssl_verify_mode: :none

    operations :ci_hss_coleman_g
    
    def initialize(emplid)
      @emplid = emplid
    end

    def details
      @details ||= self.ci_hss_coleman_g(message: { "EMPLID" => emplid }).body[:get__comp_intfc__hss_coleman_response]
    end
    
  end # PeopleSoft
end # WSDL