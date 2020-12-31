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
end