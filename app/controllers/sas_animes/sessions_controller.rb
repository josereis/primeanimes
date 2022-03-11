class SasAnimes::SessionsController < Devise::SessionsController
    def after_sign_out_path_for(admin)
        new_admin_session_path
    end

    def after_sign_in_path_for(admin)
        sas_animes_root_path
    end

    def after_sign_out_path_for(admin)
        new_admins_session_path
    end
end
