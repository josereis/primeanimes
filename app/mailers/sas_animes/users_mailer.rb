class SasAnimes::UsersMailer < ApplicationMailer
  before_action :set_user, only: %i[confirmation_email]

  def confirmation_email
    @temporary_password = params[:temporary_password]

    mail to: @user.email, subject: "[PrimeAnimes] Bem vindo ao PrimeAnimes"
  end

  private
    def set_user
      @user = params[:user]
    end
end
