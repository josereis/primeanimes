class PrimeAnimesController < ApplicationController
    before_action :authenticate_user!
    after_action :verify_authorized

    def pundit_user
        current_user
    end

    def current_admin?
        current_user.present?
    end
end