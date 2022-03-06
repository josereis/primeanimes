require 'rails_helper'

RSpec.describe "SasAnimes::Users", type: :request do
  let!(:admin) { create(:admin) }

  describe "GET /sas_animes/users" do
    let(:url) { "/sas_animes/users" }
    
    context 'admin logged in' do
      it 'return 200 status' do
        get url, headers: sign_in(admin)
        expect(response).to have_http_status(200)
      end
    end

    context 'admin is not logged in' do
      it 'return 302 status and retdirect to /admins/sign_in' do
        get url
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end
end
