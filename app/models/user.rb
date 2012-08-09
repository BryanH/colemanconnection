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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :demographic_attributes
  
  has_many    :permissions, dependent: :destroy
  has_many    :sessions, dependent: :destroy
  has_many    :program_dates, through: :sessions
  belongs_to  :demographic, autosave: true, dependent: :destroy
  
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true,
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
  
  accepts_nested_attributes_for :demographic
  
  before_create :set_sti
  
  default_scope order(:last_name)
  
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
  
private
  
  def set_sti
    self.type = self.type || "Candidate"
  end
  
end
