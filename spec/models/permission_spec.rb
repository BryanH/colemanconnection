# == Schema Information
#
# Table name: permissions
#
#  action        :string(255)
#  created_at    :datetime
#  id            :integer          not null, primary key
#  subject_class :string(255)
#  updated_at    :datetime
#  user_id       :integer
#

require 'spec_helper'

describe Permission do
  let(:permission) { Permission.new }
  subject { permission }
  
  it { should respond_to(:action) }
  it { should respond_to(:subject_class) }
  it { should respond_to(:user_id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  
  it { should belong_to(:user) }
end
