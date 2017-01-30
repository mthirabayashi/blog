require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let (:user) { User.create!(username: "guest", email: "guest@email.com", password: "password") }
  describe 'GET #index' do
    it 'populates a list of users' do
      get :index
      is_expected.to respond_with :ok
    end
    it 'responds with JSON' do
      user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      get :index
      expect(response.body).to eq(user.to_json)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user'
    it 'renders the :show template'
  end

  describe 'GET #new' do
    it 'assigns a new user to @user'
    it 'renders the :new template'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user in the database'
      it 'redirects to the home page'
    end
    context 'with invalid attributes' do
      it 'does not save the user user in the database'
      it 're-renders the :new template'
    end
  end
end
