require 'spec_helper'

describe Project do
  context 'Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }
    it { FactoryGirl.build(:project).should be_valid }
    it { Project.new.should be_invalid }
  end

  context 'Methods' do
    it 'should save project' do
      project = FactoryGirl.create(:project)
      Project.all.should include(project)
      Project.count.should eq(1)
    end
  end
end
