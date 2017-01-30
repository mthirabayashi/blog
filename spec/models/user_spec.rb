require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new}
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password). is_at_least(6). on(:create) }
  # it { should validate_uniqueness_of(:username) }
  # it { should validate_uniqueness_of(:email) }
  describe 'Session Token' do
    it 'generates session token for user' do
      expect(user.session_token).to_not be_nil
    end
  end
end
