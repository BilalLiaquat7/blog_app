before do
    @user1 = User.create(name: 'Bilal Liaquat', photo: 'photo_url1', bio: 'I am an Engineer.', posts_count: 3)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Behtareen.', comments_count: 3, likes_count: 4)
    @post2 = Post.create(author: @user1, title: 'Hello hi', text: 'Execelent.', comments_count: 3, likes_count: 4)

  end

  scenario 'display the username of the user' do
	@@ -64,4 +68,14 @@
    click_link('Add new post')
    expect(current_path).to eq(new_user_post_path(@user1))
  end

  scenario 'display pagination properly' do
    visit user_posts_path(@user1)

    expect(page).to have_css('.pagination')

    click_link('2') # Click on the second page link

    expect(page).to have_current_path(user_posts_path(@user1, page: 2))
  end
end


before do
    @user1 = User.create(name: 'Bilal Liaquat', photo: 'photo_url1', bio: 'I am an Engineer.', posts_count: 3)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Behtareen.', comments_count: 3, likes_count: 4)
    @post2 = Post.create(author: @user1, title: 'Hello hi', text: 'Execelent.', comments_count: 3, likes_count: 4)

  end

  scenario 'display the username of the user' do
	@@ -64,4 +68,14 @@
    click_link('Add new post')
    expect(current_path).to eq(new_user_post_path(@user1))
  end

  scenario 'display pagination properly' do
    visit user_posts_path(@user1)

    expect(page).to have_css('.pagination')

    click_link('2') # Click on the second page link

    expect(page).to have_current_path(user_posts_path(@user1, page: 2))
  end
end
