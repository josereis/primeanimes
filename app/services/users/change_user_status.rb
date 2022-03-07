class Users::ChangeUserStatus
    def initialize(user)
        @user = user
    end

    def active
        @user.update(status: 'active') unless @user.status.active?
    end

    def inactive
        @user.update(status: 'inactive') if @user.status.active?
    end
end