require 'rails_helper'

RSpec.describe "SasAnimes::Homes", type: :request do
  describe "GET /sas_animes" do
    let(:url) { "/sas_animes" }
        
    context 'admin logged in' do
      let(:admin) { create(:admin) }
      
      it "returns 200 status" do
        get url, headers: sign_in(admin)
        expect(response).to have_http_status(:success)
      end
    end
    
    context 'admin not logged in' do
      it 'return 302 status and redirect to sign_in admin' do
        get url
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

end
