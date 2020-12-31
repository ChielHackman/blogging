require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET index' do
    it 'Assigns @posts' do
      post = Post.create
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
end
