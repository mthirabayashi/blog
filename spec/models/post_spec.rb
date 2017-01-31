require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {Post.new}
  it { should validate_presence_of(:author_id) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
end
