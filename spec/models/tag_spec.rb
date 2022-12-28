require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'has a valid factory' do
    expect(build(:tag)).to be_valid
  end

  describe 'Validations' do
    let(:tag) { build(:tag) }

    it { expect(tag).to validate_presence_of(:name) }
    it { expect(tag).to validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    subject(:tag) { build(:tag) }

    it do
      expect(tag).to(have_many(:session_tags).dependent(:destroy))
    end

    it do
      expect(tag).to(have_many(:feedback_sessions).through(:session_tags))
    end
  end
end
