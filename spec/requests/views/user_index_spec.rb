require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  before do
    @user1 = User.create(name: 'Benjamin', photo: 'photo_url1', posts_count: 3)
    @user2 = User.create(name: 'John', photo: 'photo_url2', posts_count: 2)
  end

  scenario 'display the username of all users' do
    visit users_path
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'display the profile picture of each user' do
    visit users_path
    expect(page).to have_css("img[src='photo_url1']")
    expect(page).to have_css("img[src='photo_url2']")
  end

  scenario 'display the number of posts each user has written' do
    visit users_path
    expect(page).to have_content("Number of posts: #{@user1.posts_count}")
    expect(page).to have_content("Number of posts: #{@user2.posts_count}")
  end

  scenario 'clicking on a user redirects to the user show page' do
    visit users_path
    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))
  end
end
