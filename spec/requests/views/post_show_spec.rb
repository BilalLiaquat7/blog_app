require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 1)
    @user2 = User.create(name: 'John', photo: 'photo_url2', posts_count: 0)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 0, likes_count: 0)
    @comment1 = Comment.create(user: @user2, post: @post1, text: 'Great work Benjamin')
    @like1 = Like.create(user: @user2, post: @post1)
  end

  scenario 'display the post title' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.title)
  end

  scenario 'display the person who wrote the post' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.author.name)
  end

  scenario 'display the post body' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.text)
  end

  scenario 'display how many comments a post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content("Comments: #{@post1.comments_count}")
  end

  scenario 'display how many likes a post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content("Likes: #{@post1.likes_count}")
  end

  scenario 'display the username of each commentor' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.comments[0].user.name)
  end

  scenario 'display the comment of each commentor' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.comments[0].text)
  end

  scenario 'display comment button' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_button('Comment')
  end

  scenario 'display like button' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('Like')
  end

  scenario 'clicking on a comment button redirects to the comment new page' do
    visit user_post_path(@user1, @post1)
    click_link('Comment')
    expect(current_path).to eq(new_user_post_comment_path(user_id: @user1.id, post_id: @user1.posts[0].id))
  end

  scenario 'clicking on a like button redirects to the like create page' do
    visit user_post_path(@user1, @post1)
    click_button('Like')
    expect(current_path).to eq(user_posts_path(@post1.author.id, @post1.id))
  end
end
