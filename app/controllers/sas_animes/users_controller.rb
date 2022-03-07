class SasAnimes::UsersController < AdminController
    before_action :set_user, only: %i[show edit update active inactive destroy]

    has_scope :with_status, type: :array
    has_scope :with_profile, type: :array
    has_scope :with_email

    # GET /sas_animes/users
    def index
        authorize User
        @users = apply_scopes(Users::ListUser.new(current_admin).call).page(params[:page]).order(created_at: :desc)
    end

    # GET /sas_animes/users/:id
    def show
        authorize @user
    end

    # GET /sas_animes/users/new
    def new
        authorize User
        @user = User.new
    end

    # POST /sas_animes/users
    def create
        authorize User
        @user = Users::CreateUser.new(user_params).call
        respond_to do |format|
            if @user.persisted?
                format.html { redirect_to sas_animes_users_path, notice: 'Usuario registrado com sucesso' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # GET /sas_animes/users/:id/edit
    def edit
        authorize @user
    end

    # PUT|PATCH /sas_animes/users
    def update
        authorize @user
        
        respond_to do |format|
           if Users::UpdateUser.new(@user, user_params).call
                format.html { redirect_to sas_animes_users_path, notice: 'Usuario registrado com sucesso' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # GET /sas_animes/users/:id/active
    def active
        authorize @user, :active_and_inactive?
        if Users::ChangeUserStatus.new(@user).active
            redirect_to sas_animes_users_path, notice: "Usuário ativado com sucesso."
        else
            render :index, alert: "Não foi possivel ativar o usuário." 
        end
    end

    # GET /sas_animes/users/:id/inactive
    def inactive
        authorize @user, :active_and_inactive?
        if Users::ChangeUserStatus.new(@user).inactive
            redirect_to sas_animes_users_path, notice: "Usuário inativado com sucesso."
        else
            render :index, alert: "Não foi possivel inativar o usuário." 
        end
    end

    # DELETE /sas_animes/users/:id
    def destroy
        authorize @user
        # implementar exclusão não real
    end

    private
        def set_user
            @user = Users::FindUser.new(current_admin, params[:id]).call
        end

        def user_params
            params.require(:user).permit(:id, :name, :email, :status, :profile, :password, :password_confirmation)
        end
end
