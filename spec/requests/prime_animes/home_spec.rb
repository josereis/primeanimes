require 'rails_helper'

RSpec.describe "PrimeAnimes::Homes", type: :request do
  describe "GET /prime_animes" do
    let!(:url) { "/prime_animes" }

    context 'with authenticated user' do
        let(:user) { create(:user) }
        let(:admin) { create(:user, :admin) }
        
        it "returns 200 status for Otaku" do
            get url, headers: sign_in(user)
            expect(response).to have_http_status(200)
        end

        it "returns 200 status for Admin" do
            get url, headers: sign_in(admin)
            expect(response).to have_http_status(200)
        end
    end

    context 'with authenticated user' do
        it "return 302 status and redirect to sign_in user" do
            get url
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(new_user_session_path)
        end
    end
  end
end
