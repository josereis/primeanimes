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

  describe 'GET /sas_animes/users/new' do
    let(:url) { "/sas_animes/users/new" }

    it 'return 200 status' do
      get url, headers: sign_in(admin)
      expect(response).to have_http_status(200)
    end

    it 'return 302 status and retdirect to /admins/sign_in' do
      get url
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_admin_session_path)
    end
  end

  describe 'POST /sas_animes/users' do
    let(:url) { "/sas_animes/users" }

    context 'with valid params' do
      let(:user_params) { { user: attributes_for(:user) } }

      it 'create user' do
        post url, headers: sign_in(admin), params: user_params
        expect(User.last).to have_attributes(user_params[:user].except(:password))
      end
    end

    context 'with invalid params' do
      let(:user_invalid_params) { { user: {id: nil, name: '', email: '', password: '', password_confirmation: ''} } }

      it "does not create User" do
        expect{post url, headers: sign_in(admin), params: user_invalid_params}.to_not change(User, :count)
      end

      it 'return 422 status' do
        post url, headers: sign_in(admin), params: user_invalid_params
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'GET /sas_animes/users/:id/edit' do
    let(:user_admin) { create(:user, :admin) }

    it 'return 200 status' do
      get edit_sas_animes_user_url(user_admin), headers: sign_in(admin)
      expect(response).to have_http_status(200)
    end

    it 'return 302 status and redirect to /admins/sign_in' do
      get edit_sas_animes_user_url(user_admin)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_admin_session_path)
    end
  end

  describe "PATCH /sas_animes/users" do
    let(:user_admin) { create(:user, :admin) }
    let!(:url) { "/sas_animes/users" }

    context "with valid params" do
      let(:params) { { user: attributes_for(:user, :admin).except(:password) } }
      
      it 'updated user' do
        user_admin_id = user_admin.id
        patch sas_animes_user_path(user_admin), headers: sign_in(admin), params: params
        expect(User.find(user_admin_id)).to have_attributes(params[:user].except(:email, :password))
      end
    end
  end

  describe 'GET /sas_animes/users/:id/inactive and GET /sas_animes/users/:id/active' do
    before { create_list(:user, 3) }
    
    it 'active user' do
      first_user = User.first
      first_user.update!(status: :inactive)
      
      expect(first_user.status).to eq(:inactive)
      get active_sas_animes_user_url(first_user), headers: sign_in(admin)

      first_user = User.first
      expect(first_user.status).to eq(:active)
      get inactive_sas_animes_user_url(first_user), headers: sign_in(admin)
      expect(User.first.status).to eq(:inactive)
    end
  end
end
