require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  render_views
  let(:user) {User.create!(username: "guest", email: "guest@email.com", password: "password")}
  describe 'GET #index' do
    it 'returns a successful 200 response' do
      get :index, format: :json
      expect(response).to be_success
    end
    it 'responds with JSON' do
      # user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      post = Post.create!(author_id: user.id, body: "test body", title: 'first')
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(json[post.id.to_s]['body']).to eq(post.body)
    end
  end

  describe 'GET #show' do
    it 'returns a successful 200 response' do
      # user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      post = Post.create!(author_id: user.id, body: "test body", title: 'first')
      get :show, params: {id: post.id}, format: :json
      expect(response).to be_success
    end
    it 'responds with correct post info in JSON format' do
      # user = User.create!(username: "guest", email: "guest@email.com", password: "password")
      post = Post.create!(author_id: user.id, body: "test body", title: 'first')
      get :show, params: {id: post.id}, format: :json
      json = JSON.parse(response.body)
      expect(json[post.id.to_s]['body']).to eq(post.body)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new post in the database' do
        lb = Post.all.length
        post :create, params: {post: {author_id: user.id, body: 'test body', title: 'first'}}
        expect(Post.all.length).to eq(lb+1)
      end
      it 'returns success status' do
        post :create, params: {post: {author_id: user.id, body: 'test body', title: 'first'}}
        expect(response).to be_success
      end
    end
    context 'with invalid attributes' do
      it 'does not save the user user in the database' do
        lb = Post.all.length
        post :create, params: {post: {author_id: 0, body: ''}}
        expect(Post.all.length).to eq(lb)
      end
      it 'returns error status' do
        post :create, params: {post: {author_id: 0, body: ''}}
        expect(response).to_not be_success
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the user in the database' do
        post = Post.create!(author_id: user.id, body: "test body", title: 'first')
        patch :update, params: {id: post.id, post: {author_id: user.id, body: 'updated'}}
        expect(Post.find(post.id).body).to eq('updated')
      end
      it 'returns successful status' do
        post = Post.create!(author_id: user.id, body: "test body", title: 'first')
        patch :update, params: {id: post.id, post: {author_id: user.id, body: 'updated'}}
        expect(response).to be_success
      end
    end
    context 'with invalid attributes' do
      it 'does not update the user in the database' do
        post = Post.create!(author_id: user.id, body: "test body", title: 'first')
        patch :update, params: {id: post.id, post: {author_id: user.id, body: ''}}
        expect(Post.find(post.id).body).to eq(post.body)
      end
      it 'does not return successful status' do
        post = Post.create!(author_id: user.id, body: "test body", title: 'first')
        patch :update, params: {id: post.id, post: {author_id: user.id, body: ''}}
        expect(response).to_not be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the user from the database' do
      Post.create!(author_id: user.id, body: "test body", title: 'first')
      post = Post.create!(author_id: user.id, body: "test body 2", title: 'first')
      expect(Post.last.id).to eq(post.id)
      delete :destroy, params: {id: post.id}
      expect(Post.last.id).to_not eq(post.id)
    end
  end
end
