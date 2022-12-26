require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:feedback_session_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:feedback_session) }
  end
end
