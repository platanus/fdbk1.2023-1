require 'rails_helper'

RSpec.describe SessionTag, type: :model do
  it 'has a valid factory' do
    expect(build(:session_tag)).to be_valid
  end

  describe 'Associations' do
    subject(:session_tag) { build(:session_tag) }

    it { expect(session_tag).to(belong_to(:tag)) }
    it { expect(session_tag).to(belong_to(:feedback_session)) }
  end
end
