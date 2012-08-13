require 'spec_helper'

class MyPresenter < BasePresenter
  presents :warlock
end

describe BasePresenter do
  let(:object) { stub }
  let(:base_presenter) { BasePresenter.new(object, view) }
  
  describe '#initialize' do
    it { base_presenter.instance_variable_get('@object').should == object }
    it { base_presenter.instance_variable_get('@template').should == view }
  end
  
  it "should give access to the template" do
    base_presenter.h == view
  end
  
  it "should define a method by a given name that returns the object" do
    presenter = MyPresenter.new(object, view)
    presenter.warlock.should == object
  end
  
  describe '#handle_blank' do
    context 'without block' do
      it 'returns not available if value is blank' do
        base_presenter.send(:handle_blank, '').should include('not available')
      end
      
      it 'returns value if present' do
        base_presenter.send(:handle_blank, 'some value').should include('some value')
      end
    end
    
    context 'with block' do
      it 'returns not available if value is blank' do
        base_presenter.send(:handle_blank, '') { "some other value" }.should include('not available')
      end
      
      it 'returns value of the block if present' do
        base_presenter.send(:handle_blank, 'some value') { "some other value" }.should include('some other value')
      end
    end
  end
end