require 'rails_helper'

RSpec.describe Comment, type: :model do
  # tests go here
  post1 = Post.new(title: 'Hello', text: 'This is my first post')
  comment1 = Comment.new(post: post1, text: 'Love it')
  comment2 = Comment.new(post: post1, text: 'Great work')

  it '#update_comments_counter method should increment comments_count in post model' do
    comment1.update_comments_counter
    comment2.update_comments_counter
    expect(post1.comments_count).to eq 2
  end
end
