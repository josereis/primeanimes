class AdminController < ApplicationController
    before_action :authenticate_admin!
    after_action :verify_authorized

    def pundit_user
        current_admin
    end

    def current_admin?
        current_admin.present?
    end
end