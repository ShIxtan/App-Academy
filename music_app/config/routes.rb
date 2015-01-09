Rails.application.routes.draw do
  root to: 'bands#index'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]

  resources :bands do
    resources :albums, only: [:new, :index]
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: [:new, :index]
  end

  resources :tracks, except: [:new, :index] do
    resources :notes, only: [:create, :destroy]
  end
end
