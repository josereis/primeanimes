# Preview all emails at http://localhost:3000/rails/mailers/sas_animes/users
class SasAnimes::UsersPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sas_animes/users/confirmation_email
  def confirmation_email
    SasAnimes::UsersMailer.confirmation_email
  end

end
