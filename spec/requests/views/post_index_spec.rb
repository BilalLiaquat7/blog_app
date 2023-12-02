require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 3)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 3, likes_count: 4)
  end

  scenario 'display the username of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@user1.name)
  end

  scenario 'display the profile picture of the user' do
    visit user_posts_path(@user1)
    expect(page).to have_css("img[src='photo_url1']")
  end

  scenario 'display the number of posts the user has written' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Number of posts: #{@user1.posts_count}")
  end

  scenario 'display the post title' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post1.title)
  end

  scenario 'display some of the post body' do
    visit user_posts_path(@user1)
    expect(page).to have_content(@post1.text)
  end

  scenario 'display the first comments on a post' do
    visit user_posts_path(@user1)
    @post1.recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  scenario 'display how many comments a post has' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Comments: #{@post1.comments_count}")
  end

  scenario 'display how many likes a post has' do
    visit user_posts_path(@user1)
    expect(page).to have_content("Likes: #{@post1.likes_count}")
  end

  scenario 'display Add new post button' do
    visit user_posts_path(@user1)
    expect(page).to have_button('Add new post')
  end

  scenario 'clicking on a post redirects to the post show page' do
    visit user_posts_path(@user1)
    click_link @user1.posts[0].title
    expect(current_path).to eq(user_post_path(@user1, @user1.posts[0]))
  end

  scenario 'clicking on a Add new post redirects to the post new page' do
    visit user_posts_path(@user1)
    click_link('Add new post')
    expect(current_path).to eq(new_user_post_path(@user1))
  end
end
