require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET index' do
    it 'Assigns @posts' do
      post = Post.create(title: 'Title', body: 'Body')
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it 'Renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'Assigns @post' do
      post = Post.new
      get :new
      expect(assigns(:post).id).to eq(post.id)
    end

    it 'Renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    it 'Saves a valid post' do
      post_count = Post.count
      post :create, params: { post: { title: 'Title', body: 'Body' } }
      expect(Post.count).to eq(post_count + 1)
    end

    it 'Does not saves a invalid post' do
      post_count = Post.count
      post :create, params: { post: { title: 'Title' } }
      expect(Post.count).to eq(post_count)
    end
  end

  describe 'GET edit' do
    it 'Assigns @post' do
      post = Post.create(title: 'Title', body: 'Body')
      get :edit, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end

    it 'Renders the edit template' do
      post = Post.create(title: 'Title', body: 'Body')
      get :edit, params: { id: post.id }
      expect(response).to render_template('edit')
    end
  end

  describe 'PUT update' do
    it 'Updates a valid post' do
      post = Post.create(title: 'Title', body: 'Body')
      put :update, params: { id: post.id, post: { title: 'New title' } }
      expect(Post.find(post.id).title).to eq('New title')
    end

    it 'Does not update a invalid post' do
      post = Post.create(title: 'Title', body: 'Body')
      put :update, params: { id: post.id, post: { title: nil } }
      expect(Post.find(post.id).title).to eq('Title')
    end
  end
end
