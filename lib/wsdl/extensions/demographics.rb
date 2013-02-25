module WSDL
  module Extensions
    module Demographics
      extend ActiveSupport::Concern
      
      module InstanceMethods
        def first_name
          self.details[:first_name] || "Not Available"
        end
        
        def last_name
          self.details[:last_name] || "Not Available"
        end
        
        def full_name
          "#{first_name} #{last_name}"
        end
        
        def birthday
          self.details[:birthdate] || "Not Available"
        end
        
        def sex
          case self.details[:sex]
          when "F" then 'Female'
          when "M" then 'Male'
          else "Not Available"
          end
        end
      end
      
      def home_address
        self.details[:home_address1] || "Not Available"
      end
      
      def home_city
        self.details[:home_city] || "Not Available"
      end
      
      def home_state
        self.details[:home_state] || "Not Available"
      end
      
      def home_postal
        self.details[:home_postal] || "Not Available"
      end
      
      def mailing_address
        self.details[:mail_address1] || "Not Available"
      end
      
      def mailing_city
        self.details[:mail_city] || "Not Available"
      end
      
      def mailing_state
        self.details[:mail_state] || "Not Available"
      end
      
      def mailing_postal
        self.details[:mail_postal] || "Not Available"
      end
      
      def permanent_address
        self.details[:permanent_address1] || "Not Available"
      end
      
      def permanent_city
        self.details[:permanent_city] || "Not Available"
      end
      
      def permanent_state
        self.details[:permanent_state] || "Not Available"
      end
      
      def permanent_postal
        self.details[:permanent_postal] || "Not Available"
      end
      
      def preferred_phone_number
        self.details[:hcc_prf_phone] || "Not Available"
      end
      
      def home_phone_number
        self.details[:home_phone] || "Not Available"
      end
      
      def mobile_phone_number
        self.details[:hcc_cell_phone] || "Not Available"
      end
      
      def preferred_email_address
        self.details[:hcc_prf_email] || "Not Available"
      end
      
      def hcc_email_address
        self.details[:hcc_email_addr] || "Not Available"
      end
      
      def personal_email_address
        self.details[:email_addr] || "Not Available"
      end
      
    end # Demographics
  end # Extensions
end # WSDL