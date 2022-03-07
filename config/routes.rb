Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords, :confirmations, :mailer], controllers: { sessions: 'sas_animes/sessions' }
  devise_for :users, controllers: {sessions: 'prime_animes/sessions'}

  namespace :sas_animes do
    resources :users, on: :collection do
      get "active", on: :member, to: "users#active"
      get "inactive", on: :member, to: "users#inactive"
    end

    root to: 'home#index'
  end

  namespace :prime_animes do
    root to: 'home#index'
  end

  root to: 'welcome#index'
end
