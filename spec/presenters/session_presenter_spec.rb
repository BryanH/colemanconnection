require 'spec_helper'

describe SessionPresenter do
  let(:object) { Session.new }
  let(:presenter) { SessionPresenter.new(object, view) }
  subject { presenter }
  
  it { should respond_to(:program) }
  it { should respond_to(:occurs_on) }
  it { should respond_to(:attended?) }
end