require 'spec_helper'

describe Task do
  it { should have_db_index(:project_id) }

  context 'associations' do
    it { should belong_to(:project) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }

    it { should allow_mass_assignment_of(:project_id) }
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:deadline) }
    it { should allow_mass_assignment_of(:finish) }

    context 'should be valid' do
      subject { FactoryGirl.build(:task) }
      it { should be_valid }
    end

    context 'should not be new_record' do
      subject { FactoryGirl.create(:task) }
      it { should_not be_new_record }
    end
  end

  describe 'should validates finish field' do
    context 'should be not finish' do
      subject { FactoryGirl.create(:task) }
      it { should_not be_finish }
    end

    context 'should be finish' do
      subject { FactoryGirl.create(:task, finish: true) }
      it { should be_finish }
    end
  end

  describe 'deadline field should be Date' do
    subject { FactoryGirl.create(:task, deadline: Date.today) }
    it { subject._timeliness_raw_value_for('deadline').should eq Date.today }
  end
end
