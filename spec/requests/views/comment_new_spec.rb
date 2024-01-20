require 'rails_helper'

RSpec.describe 'comments#new', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', bio: 'I am a software developer.', posts_count: 1)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', comments_count: 0, likes_count: 0)
  end

  scenario 'display Add new comment' do
    visit new_user_post_comment_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_content('Add new comment')
  end

  scenario 'fill comment form' do
    visit new_user_post_comment_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_field('comment_text', placeholder: 'Add your comment here')
  end

  scenario 'display Comment submit button' do
    visit new_user_post_comment_path(user_id: @post1.author.id, post_id: @post1.id)
    expect(page).to have_button('Comment')
  end

  scenario "clicking on a comment button redirects to the post's comments index page" do
    visit new_user_post_comment_path(user_id: @post1.author.id, post_id: @post1.id)
    click_button('Comment')
    expect(current_path).to eq(user_post_comments_path(@post1.author.id, @post1.id))
  end
end
