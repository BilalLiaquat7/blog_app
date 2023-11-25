require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Binyam', photo: 'url', bio: 'I am a software developer.') }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'Good career choice.', comments_count: 3, likes_count: 4) }

  describe 'GET /index' do
    it 'returns http success for posts#index action' do
      get user_posts_url(user_id: user.id)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a list of posts for a given user.')
    end
  end

  describe 'GET /show' do
    it 'returns a specific post for posts#show action' do
      get user_post_url(user_id: user.id, id: post.id)
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include('Here is a specific post for a given user.')
    end
  end
end
