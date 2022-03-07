class Users::UpdateUser
    attr_accessor :user, :user_params

    def initialize(user, user_params)
        @user = user
        @user_params = user_params
    end

    def call
        @user_params = @user_params.except(:password, :password_confirmation) if (@user_params[:password].blank? && @user_params[:password_confirmation].blank?)
        @user.assign_attributes(@user_params)
        @user.save
    end
end