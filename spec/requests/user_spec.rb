require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success for users#index action' do
      get users_url
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a list of users.')
    end
  end

  describe 'GET /show' do
    let(:user) { create(:user, name: 'Binyam', photo: 'url', bio: 'I am a software developer.') }

    it 'returns a specific user for users#show action' do
      get user_url(user)
      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(response.body).to include('Here is a specific user.')
    end
  end
end
