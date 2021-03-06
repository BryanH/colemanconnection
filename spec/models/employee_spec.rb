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
    
    before do
      terry.permissions.create!(action: 'view', subject_class: 'Employee')
      expect(terry.reload.permissions.count).to be 1
      terry.deactivate!
    end
    
    it { should_not be_active }
    its(:permissions) { should be_blank }
  end
  
  describe "search scope" do
    let(:terry) { FactoryGirl.create(:employee, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:employee, first_name: "Brian", last_name: "Waddle") }
    
    it "should not list Terry" do
      expect(Employee.search('Brian')).to_not include(terry)
      expect(Employee.search('Brian')).to include(brian)
    end
    
    it "should not list Brian" do
      expect(Employee.search('Terry')).to_not include(brian)
      expect(Employee.search('Terry')).to include(terry)
    end
    
    it "should return all employees" do
      expect(Employee.search(nil)).to include(terry, brian)
    end
  end
  
  describe "active scope" do
    let(:terry) { FactoryGirl.create(:employee, :active, first_name: "Terry", last_name: "Schmidt") }
    let(:brian) { FactoryGirl.create(:employee, :inactive, first_name: "Brian", last_name: "Waddle") }
    
    it "should return Terry" do
      expect(Employee.active(true)).to include(terry)
      expect(Employee.active(true)).to_not include(brian)
    end
    
    it "should return Brian" do
      expect(Employee.active(false)).to include(brian)
      expect(Employee.active(false)).to_not include(terry)
    end
    
    it "should not return anything" do
      expect(Employee.active(nil)).to be_blank
    end
  end
  
end
