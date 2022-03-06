class PrimeAnimes::HomeController < PrimeAnimesController
  def index
    authorize User, policy_class: PrimeAnimesPolicy
  end
end
