class Users::ListUser
    attr_reader :user

    def initialize(user)
        @user = user
    end

    def call
        UserPolicy::Scope.new(user, User).resolve
    end
end