# == Schema Information
#
# Table name: users
#
#  active                 :boolean          default(TRUE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  created_at             :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  demographic_id         :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(128)      default(""), not null
#  first_name             :string(255)
#  id                     :integer          not null, primary key
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  role_mask              :integer
#  sign_in_count          :integer          default(0)
#  type                   :string(255)
#  updated_at             :datetime
#

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :async,
         :recoverable, :rememberable, :trackable, :validatable

  # Run devise mailers asynchronously
## BDH#  include Devise::Async::Model

  ## THESE ARE BOTH FLAWED AND WILL BE REMOVED
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #VALID_USERNAME_REGEX = /^[a-z](?=[\w.]{3,31}$)\w*\.?\w*$/i

  # Virtual attribute for authenticating by either the username or email
#  attr_accessor :login

#  attr_accessible :email, :password, :password_confirmation, :remember_me,
#                  :first_name, :last_name, :demographic_attributes, :username,
#                  :login, :program_affiliations
#
  has_many    :permissions, dependent: :destroy
  has_many    :sessions, dependent: :destroy
  has_many    :program_dates, through: :sessions
  belongs_to  :demographic, autosave: true, dependent: :destroy

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :username,    uniqueness: { case_sensitive: false,
                                        allow_blank: true,
                                        allow_nil: true
#                                      },
#                          format: {
#				     with: VALID_USERNAME_REGEX,
#                                    allow_blank: true,
#                                    allow_nil: true
                                  }
  validates :email,       presence: true,
#                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }

  accepts_nested_attributes_for :demographic

  before_create :set_sti

  default_scope { order('lower(last_name) ASC') }

  scope :search, lambda { |query| where{first_name.matches("%#{query}%") |
                                        last_name.matches("%#{query}%") |
                                        email.matches("%#{query}%") }}


  # Need to overwrite the Devise method to support logging in by either
  # username or email address
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(['username = :value or email = :value',
                                { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def name
    fname = first_name.blank? ? changes["first_name"].first : first_name
    lname = last_name.blank? ? changes["last_name"].first : last_name
    [fname, lname].join(' ')
  end

  def reversed_name
    [last_name, first_name].join(', ')
  end

  def program_sessions
    sessions.where{ program_date_id.not_eq nil }
  end

  def affiliated_programs
    if self.program_affiliations
      @programs ||= YAML.load self.program_affiliations
    else
      @programs = nil
    end
  end

  def affiliated_with?(program=nil)
    return false unless program.present?
    return false unless self.program_affiliations.present?
    programs = YAML.load self.program_affiliations
    programs.include?(program)
  end

  # Override the behavior of the email lookup for Devise Password reset
  def self.send_reset_password_instructions(attributes={})
    attributes[:email] = attributes[:email].try(:downcase)
    super(attributes)
  end

private

  def set_sti
    self.type = self.type || "Candidate"
  end

end
