class ApplicationController < ActionController::Base
    include Pundit::Authorization
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
        end

    private
        def user_not_authorized
            render "errors/user_not_authorized", status: :unauthorized
        end

        def record_not_found
            render "errors/file_not_found", status: :not_found
        end
end
