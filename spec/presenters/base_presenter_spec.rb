require_relative '../../app/presenters/base_presenter'

class MyPresenter < BasePresenter
  presents :warlock
end

describe BasePresenter do
  let(:object) { stub }
  let(:template) { stub }
  let(:base_presenter) { BasePresenter.new(object, template) }
  
  describe '#initialize' do
    it { base_presenter.instance_variable_get('@object').should == object }
    it { base_presenter.instance_variable_get('@template').should == template }
  end
  
  it "should give access to the template" do
    base_presenter.h == template
  end
  
  it "should define a method by a given name that returns the object" do
    presenter = MyPresenter.new(object, template)
    presenter.warlock.should == object
  end
end