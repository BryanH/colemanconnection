require 'spec_helper'

describe Staff do
  
  describe '#activate!' do
    let(:terry) { FactoryGirl.create(:staff, :inactive) }
    subject { terry }
    before { terry.activate! }
    it { should be_active }
  end
  
  describe '#deactivate!' do
    let(:terry) { FactoryGirl.create(:staff, :active) }
    subject { terry }
    before { terry.deactivate! }
    it { should_not be_active }
  end
  
  describe "search scope" do
    let(:terry) { FactoryGirl.create(:staff, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:staff, first_name: "Brian", last_name: "Waddle") }
    
    it "should not list Terry" do
      Staff.search('Brian').should_not include(terry)
      Staff.search('Brian').should include(brian)
    end
    
    it "should not list Brian" do
      Staff.search('Terry').should_not include(brian)
      Staff.search('Terry').should include(terry)
    end
    
    it "should return all staff" do
      Staff.search(nil).should == [terry, brian]
    end
  end
  
  describe "active scope" do
    let(:terry) { FactoryGirl.create(:staff, :active, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:staff, :inactive, first_name: "Brian", last_name: "Waddle") }
    
    it "should return Terry" do
      Staff.active(true).should include(terry)
      Staff.active(true).should_not include(brian)
    end
    
    it "should return Brian" do
      Staff.active(false).should include(brian)
      Staff.active(false).should_not include(terry)
    end
    
    it "should not return anything" do
      Staff.active(nil).should be_blank
    end
  end
  
end
