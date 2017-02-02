require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  #xdescribe = temp skip
  xdescribe 'current user' do
    it 'finds current user' do
      user = User.create(username: 'guest', password: 'password', email: 'guest@email.com', session_token: '123')
      request.cookies[session_token: user.session_token]
      expect(response).to be_success
    end
  end
  describe 'login user' do
    it 'logs in user'
  end
  describe 'logout user' do
    it 'logs out user'
  end
end
