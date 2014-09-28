Rails.application.routes.draw do
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
    end
    #resources :orders
  end

  resource :account, only: [:show, :edit, :update]
  resources :orders, only: [:index, :show, :destroy]
  
end
