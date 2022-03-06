class SasAnimes::UsersController < AdminController
    has_scope :with_status, type: :array
    has_scope :with_profile, type: :array
    has_scope :with_email

    def index
        authorize User
        @users = apply_scopes(Users::ListUser.new(current_admin).call).page(params[:page]).order(created_at: :desc)
    end
end
