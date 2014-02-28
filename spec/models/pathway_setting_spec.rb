require 'spec_helper'

describe PathwaySetting do
  let(:pathway_setting) { PathwaySetting.new}
  subject { pathway_setting }
  
  it { should respond_to :program }
  it { should respond_to :program_id }
  it { should respond_to :url }
  it { should respond_to :tags }
end