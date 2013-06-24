require 'spec_helper'

describe Project do
  it { should have_db_index(:user_id) }

  context 'Associations' do
    it { should have_many(:tasks).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  context 'Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }

    it { should allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:name) }

    describe 'new record should be valid' do
      subject { build(:project) }
      it { should be_valid }
    end

    describe 'new record should be save' do
      subject { create(:project) }
      it { should_not be_new_record }
    end
  end
end
