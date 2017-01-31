require 'rails_helper'

RSpec.describe Api::FollowsController, type: :controller do
  render_views
  let(:user1) {User.create!(username: "guest", email: "guest@email.com", password: "password")}
  let(:user2) {User.create!(username: "guest2", email: "guest2@email.com", password: "password")}

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new follow in the database' do
        # follow = Follow.create!(following_id: user2.id, follower_id: user1.id)
        post :create, params: {follow: {following_id: user2.id, follower_id: user1.id}}
        expect(user2.followers).to include(user1)
      end
      it 'returns success status' do
        post :create, params: {follow: {following_id: user2.id, follower_id: user1.id}}
        expect(response).to be_success
      end
    end
    context 'with invalid attributes' do
      it 'does not save the follow user in the database' do
        post :create, params: {follow: {following_id: user2.id, follower_id: -1}}
        expect(user2.followers).to_not include(user1)
      end
      it 'returns error status' do
        post :create, params: {follow: {following_id: user2.id, follower_id: -1}}
        expect(response).to_not be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the follow from the database' do
      follow = Follow.create!(following_id: user2.id, follower_id: user1.id)
      expect(Follow.where(id: follow.id)).to exist
      delete :destroy, params: {id: follow.id}
      expect(Follow.where(id: follow.id)).to_not exist
    end
  end
end
