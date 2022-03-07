class PrimeAnimes::UsersController < PrimeAnimesController
    before_action { @menu = 'management' }
    before_action :set_user, only: %i[show active inactive]

    has_scope :with_status, type: :array
    has_scope :with_profile, type: :array
    has_scope :with_email

    # GET /prime_animes/users
    def index
        authorize User
        @users = apply_scopes(Users::ListUser.new(current_user).call).page(params[:page]).order(created_at: :desc)
    end

    # GET /prime_animes/users/:id
    def show
        authorize @user
    end

    # GET /prime_animes/users/:id/active
    def active
        authorize @user, :active_and_inactive?
        if Users::ChangeUserStatus.new(@user).active
            redirect_to prime_animes_users_path, notice: "Usuário ativado com sucesso."
        else
            render :index, alert: "Não foi possivel ativar o usuário." 
        end
    end

    # GET /prime_animes/users/:id/inactive
    def inactive
        authorize @user, :active_and_inactive?
        if Users::ChangeUserStatus.new(@user).inactive
            redirect_to prime_animes_users_path, notice: "Usuário inativado com sucesso."
        else
            render :index, alert: "Não foi possivel inativar o usuário." 
        end
    end

    private
        def set_user
            @user = Users::FindUser.new(current_user, params[:id]).call
        end
end
