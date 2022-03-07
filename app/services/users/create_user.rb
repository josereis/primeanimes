class Users::CreateUser
    attr_reader :user_params

    def initialize(user_params)
        @user_params = user_params
    end

    def call
        password = user_params[:password]
        
        user = User.new(user_params)
        user.skip_confirmation!
        user.save
        user.send_confirmation_email(password)
        user
    end
end