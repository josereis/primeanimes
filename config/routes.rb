Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords, :confirmations, :mailer], controllers: { sessions: 'sas_animes/sessions' }
  
  namespace :sas_animes do
    root to: 'home#index'
  end

  root to: 'welcome#index'
end
