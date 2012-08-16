require 'spec_helper'

describe Employee do
  
  describe '#activate!' do
    let(:terry) { FactoryGirl.create(:employee, :inactive) }
    subject { terry }
    before { terry.activate! }
    it { should be_active }
  end
  
  describe '#deactivate!' do
    let(:terry) { FactoryGirl.create(:employee, :active) }
    subject { terry }
    before { terry.deactivate! }
    it { should_not be_active }
  end
  
  describe "search scope" do
    let(:terry) { FactoryGirl.create(:employee, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:employee, first_name: "Brian", last_name: "Waddle") }
    
    it "should not list Terry" do
      Employee.search('Brian').should_not include(terry)
      Employee.search('Brian').should include(brian)
    end
    
    it "should not list Brian" do
      Employee.search('Terry').should_not include(brian)
      Employee.search('Terry').should include(terry)
    end
    
    it "should return all employees" do
      Employee.search(nil).should include(terry, brian)
    end
  end
  
  describe "active scope" do
    let(:terry) { FactoryGirl.create(:employee, :active, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:employee, :inactive, first_name: "Brian", last_name: "Waddle") }
    
    it "should return Terry" do
      Employee.active(true).should include(terry)
      Employee.active(true).should_not include(brian)
    end
    
    it "should return Brian" do
      Employee.active(false).should include(brian)
      Employee.active(false).should_not include(terry)
    end
    
    it "should not return anything" do
      Employee.active(nil).should be_blank
    end
  end
  
end
