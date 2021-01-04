require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Is a valid post' do
    post = Post.new
    expect(post.valid?).to eq(false)
  end

  it 'Is a invalid post' do
    post = Post.new(title: 'Title', body: 'Body')
    expect(post.valid?).to eq(true)
  end
end
