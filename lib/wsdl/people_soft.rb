require_relative 'extensions/citizenship'
require_relative 'extensions/military'
require_relative 'extensions/testing'
require_relative 'extensions/transcripts'

module WSDL
  class PeopleSoft
    attr_accessor :client, :response, :details
    attr_reader   :actions
    
    include WSDL::Extensions::Citizenship
    include WSDL::Extensions::Military
    include WSDL::Extensions::Testing
    include WSDL::Extensions::Transcripts
    
    HCC_WSDL = Savon::Client.new('https://pscsigwbn.hccs.edu:8080/PSIGW/PeopleSoftServiceListeningConnector/CI_HSS_COLEMAN.1.wsdl')
    
    def initialize(student_id)
      @client = HCC_WSDL
      @client.http.auth.ssl.verify_mode = :none
      @actions = @client.wsdl.soap_actions
      search(student_id)
      self
    end
    
    def pretty_details
      "".tap do |printable|
        self.details.each_pair do |kee, val|
          next if kee == :"@xmlns:m89"
          printable << printify(kee, val)
        end
      end
    end
    
private
    
    def search(student_id)
      begin
        self.client.http.headers["SOAPAction"] = '"http://xmlns.oracle.com/Enterprise/Tools/schemas/M890184.V1"'
        self.response = self.client.request :m89, "Get__CompIntfc__HSS_COLEMAN" do
          soap.namespaces['xmlns:m89'] = 'http://xmlns.oracle.com/Enterprise/Tools/schemas/M890184.V1'
          http.headers['SOAPAction'] = '"CI_HSS_COLEMAN_G.V1"'
          soap.body = { 'EMPLID' => student_id }
        end

        process_response
        self
      rescue
        nil
      end
    end
  
    def process_response
      if self.response.success?
        self.details = self.response.to_array(:get__comp_intfc__hss_coleman_response).first
      else
        self.details = nil
      end
    end
    
    def printify(kee, val)
      case val
      when Array
        "".tap do |str|
          str << "\n" << "#{kee}\n" << '='*25 << "\n"
          val.map do |v|
            v.each_pair do |kee2, val2|
              str << "\t" << printify(kee2, val2)
            end
            str << "\n"
          end.join("\n")
        end
      else
        "%-30.30s%s\n" % [ kee, val ]
      end
    end
  end # PeopleSoft
end # WSDL