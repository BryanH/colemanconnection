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
    expect(base_presenter.h).to eq view
  end
  
  it "should define a method by a given name that returns the object" do
    presenter = MyPresenter.new(object, view)
    expect(presenter.warlock).to eq object
  end
  
  describe '#handle_blank' do
    context 'without block' do
      it 'returns not available if value is blank' do
        expect(base_presenter.send(:handle_blank, '')).to include('not available')
      end
      
      it 'returns value if present' do
        expect(base_presenter.send(:handle_blank, 'some value')).to include('some value')
      end
    end
    
    context 'with block' do
      it 'returns not available if value is blank' do
        expect(base_presenter.send(:handle_blank, '') { "some other value"}).to include('not available')
      end
      
      it 'returns value of the block if present' do
        expect(base_presenter.send(:handle_blank, 'some value') { "some other value"}).to include('some other value')
      end
    end
  end
end