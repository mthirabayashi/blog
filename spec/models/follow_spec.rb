require 'rails_helper'

RSpec.describe Follow, type: :model do
  it { should validate_presence_of(:followed_id) }
  it { should belong_to(:person_getting_followed) }
  it { should belong_to(:person_following) }
end
