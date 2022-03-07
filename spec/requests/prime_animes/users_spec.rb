require 'rails_helper'

RSpec.describe "PrimeAnimes::Users", type: :request do
  describe "GET /prime_animes/users" do
    let!(:url) { "/prime_animes/users" }

    context 'user not logged in' do
      it 'return 302 status and redirect to /users/sign_in' do
        get url
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'authorized user' do
      let(:admin) { create(:user, :admin) }

      it 'return 200 status' do
        get url, headers: sign_in(admin)
        expect(response).to have_http_status(200)
      end

      it 'active user' do
        create(:user, :user_inactive)
        
        find_user = User.last
        get active_prime_animes_user_path(find_user), headers: sign_in(admin)
        expect(User.find(find_user.id).status).to eq('active')
      end

      it 'inactive user' do
        create(:user, :admin)
        
        find_user = User.last
        get inactive_prime_animes_user_path(find_user), headers: sign_in(admin)
        expect(User.find(find_user.id).status).to eq('inactive')
      end
    end

    context 'unauthorized user' do
      let(:user) { create(:user) }

      it 'return 401 status' do
        get url, headers: sign_in(user)
        expect(response).to have_http_status(401)
      end

      it 'return 401 status for active user' do
        create(:user, :user_inactive)

        get active_prime_animes_user_path(User.last), headers: sign_in(user)
        expect(response).to have_http_status(401)
      end

      it 'return 401 status for inactive user' do
        create(:user)

        get inactive_prime_animes_user_path(User.last), headers: sign_in(user)
        expect(response).to have_http_status(401)
      end
    end
  end
end
