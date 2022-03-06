class SasAnimes::HomeController < AdminController
  def index
    authorize Admin, policy_class: AdminPolicy
  end
end
