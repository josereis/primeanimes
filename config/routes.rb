Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords, :confirmations, :mailer], controllers: { sessions: 'sas_animes/sessions' }

  root to: 'welcome#index'
end
