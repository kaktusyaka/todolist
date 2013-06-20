require 'spec_helper'

describe User do
  context "validations" do
    it { should have_many(:projects) }
    it { should_not allow_value('asd', 'asd@oit', 'jahs@ljkhsd.com').for(:email) }
    it { should allow_value(Faker::Internet.email).for(:email) }
  end

  context "Methods" do
    it "should save new user" do
      user = FactoryGirl.create(:user)
      User.all.should include(user)
      User.count.should eq(1)
    end
  end
end
