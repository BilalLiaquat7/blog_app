require 'rails_helper'

RSpec.describe 'posts#new', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 1)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 0, likes_count: 0)
  end

  scenario 'display Add new post' do
    visit new_user_post_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_content('Add new post')
  end

  scenario 'fill title area in the post form' do
    visit new_user_post_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_field('post_title', placeholder: 'Add your title here')
  end

  scenario 'fill text area in the post form' do
    visit new_user_post_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_field('post_text', placeholder: 'Add your text here')
  end

  scenario 'display create button' do
    visit new_user_post_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_button('Create')
  end

  scenario 'clicking on a create button redirects to the post index page' do
    visit new_user_post_path(user_id: @post1.author.id)
    click_button('Create')
    expect(current_path).to eq(user_posts_path(@post1.author.id))
  end
end
