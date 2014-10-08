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
    resources :inboxes, only: [:index, :show, :new, :create, :destroy]
    get '/inboxes/new/(:parent_id)', to: 'inboxes#new_reply', as: :new_reply
  end

  resource :account, only: [:show, :edit, :update]
  resources :orders, only: [:index, :show, :destroy]
  resources :payments, only: [:index, :show]
  resources :vouchers, only: [:index, :show]
  
end
