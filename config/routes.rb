require 'sidekiq/web'
Rails.application.routes.draw do

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'root' && password == '123456'
  end
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'
    }, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :fotos do
    member do
      get :download
    end
  end

  resources :modulos do
    member do
      patch :sort
      patch :aprovar_texto
      patch :desaprovar_texto
    end
  end

  resources :modulo_detalhes do
    member do
      patch :sort_detalhes
    end
  end

  resources :informacoes do
    member do
      patch :aprovar
      patch :desaprovar
      patch :inativar
      patch :sort
    end
  end

  resources :informacao_detalhes do
    member do
      patch :sort_detalhes
    end
  end

  resources :notificacoes do
    member do
      patch :aprovar
      patch :inativar
    end
  end

  resources :ufs, only: [:index]
  resources :municipios, only: [:index]

  resources :tipo_entidades
  resources :atuacoes
  resources :origens
  resources :entidades
  resources :tipo_detalhes
  resources :tipo_servicos
  resources :servicos do
    member do
      patch :aprovar_texto
      patch :desaprovar_texto
    end
  end
  resources :servico_detalhes do
    member do
      patch :sort_detalhes
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboards#index"
  get 'dashboards/home'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
