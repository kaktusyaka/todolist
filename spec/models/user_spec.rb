require 'spec_helper'

describe User do
  context 'Associations' do
    it { should have_many(:projects).dependent(:destroy) }
  end

  context "validations" do
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:email) }

    it { should_not allow_value('asd', 'asd@oit', 'jahs@ljkhsd.com').for(:email) }
    it { should allow_value(Faker::Internet.email).for(:email) }

    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
  end

  context "Methods" do
    it "should save new user" do
      user = FactoryGirl.create(:user)
      User.all.should include(user)
      User.count.should eq(1)
    end
  end
end
