class Users::FindUser
    attr_reader :user, :find_user_id

    def initialize(user, find_user_id)
        @user = user
        @find_user_id = find_user_id
    end

    def call
        (Users::ListUser.new(user).call).find(find_user_id)
    end
end