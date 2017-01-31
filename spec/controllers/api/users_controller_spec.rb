require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  # let (:user) { User.create!(username: "guest", email: "guest@email.com", password: "password") }
  render_views
  # let(:json) {JSON.parse(response.body)}

  describe 'GET #index' do
    it 'returns a successful 200 response' do
      # request.accept = 'application/json'
      # get :index
      get :index, format: :json
      expect(response).to be_success
    end
    it 'responds with JSON' do
      user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(json[user.id.to_s]['username']).to eq(user.username)
    end
  end

  describe 'GET #show' do
    it 'returns a successful 200 response' do
      user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      get :show, params: {id: user.id}, format: :json
      expect(response).to be_success
    end
    it 'responds with correct user info in JSON format' do
      user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      get :show, params: {id: user.id}, format: :json
      # debugger
      json = JSON.parse(response.body)
      expect(json[user.id.to_s]['username']).to eq(user.username)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database' do
        post :create, params: {user: {username: 'guest', email: 'guest@email.com', password: 'password'}}
        expect(response).to be_success
      end
    end
    context 'with invalid attributes' do
      it 'does not save the user user in the database' do
        post :create, params: {user: {username: 'guest', email: 'guest@email.com', password: '123'}}
        expect(response).to_not be_success
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the user in the database' do
        user = User.create!(username: "guest", email: "guest@email.com", password: "password")
        patch :update, params: {id: user.id, user: {username: 'guest', email: 'guestupdated@email.com', password: 'password'}}
        expect(response).to be_success
      end
    end
    context 'with invalid attributes' do
      it 'does not update the user in the database' do
        user = User.create!(username: "guest", email: "guest@email.com", password: "password")
        patch :update, params: {id: user.id, user: {username: 'guest', email: '', password: 'password'}}
        expect(response).to_not be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user from the database' do
      User.create!(username: "guest", email: "guest@email.com", password: "password")
      user = User.create!(username: "guest2", email: "guest2@email.com", password: "password")
      expect(User.last.id).to eq(user.id)
      delete :destroy, params: {id: user.id}
      expect(User.last.id).to_not eq(user.id)
    end
  end
end
