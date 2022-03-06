class PrimeAnimes::SessionsController < Devise::SessionsController
    def sign_in_path_for(user)
        user = User.find_by_email(params[:user][:email])

        if user.present?
            if user.try(:confirmed_at).present?
                super
            else
                redirect_to new_user_session_path, alert:  'Por favor, confirme seu email primeiro.'
            end
        else
            redirect_to new_user_session_path, alert:  'Usuário não cadastrado.'
        end
    end

    def after_sign_in_path_for(user)
        prime_animes_root_path
    end

    def after_sign_out_path_for(user)
        new_user_session_path
    end
end
