# == Schema Information
#
# Table name: pathway_settings
#
#  id         :integer          not null, primary key
#  program_id :integer
#  url        :string(255)
#  tags       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe PathwaySetting do
  let(:pathway_setting) { PathwaySetting.new}
  subject { pathway_setting }
  
  it { should respond_to :program }
  it { should respond_to :program_id }
  it { should respond_to :url }
  it { should respond_to :tags }
end
