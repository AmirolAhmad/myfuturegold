Rails.application.routes.draw do
  get 'about', to: 'pages#about'

  namespace :admin do
  get 'orders/index'
  end

  devise_for :users
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'
  end
  root 'pages#index'

  namespace :admin, path: '/master' do
    get "/" => "dashboards#index", as: 'master'
    resources :dashboards, only: [:index]
    resources :users do
      resources :orders
      resources :payments
      resources :vouchers
    end
    resources :inboxes do
      member do
        post :reply
      end
    end
    resources :announcements
  end

  resource :account, only: [:show, :edit, :update]
  resources :orders, only: [:index, :new, :create, :show, :destroy]
  resources :payments, only: [:index, :new, :create, :show]
  resources :vouchers, only: [:index, :show]
  
end
