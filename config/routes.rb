Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'

    }
  
  devise_scope :user do
    get 'email', to: 'users/registrations#email'
    post 'email', to: 'users/registrations#email'
    get 'tel', to: 'users/registrations#tel'
    post 'tel', to: 'users/registrations#tel'
    get 'authen', to: 'users/registrations#authen'
    post 'authen', to: 'users/registrations#authen'
    get 'addresses', to: 'users/registrations#address'
    post 'addresses', to: 'users/registrations#address'
    get 'credit', to: 'users/registrations#credit'
    post 'credit', to: 'users/registrations#credit'
    get 'done', to: 'users/registrations#done'
    post 'done', to: 'users/registrations#done'
    get 'logout', to: "users#logout"
    get 'creditcard', to: "users#creditcard"
    get 'cardregister', to: "users#cardregister"
  end
  root to: "items#index"

  resources :card, only: [:new, :show, :destroy] do
    collection do
      post 'get', to: 'card#pay'
      post 'pay', to: 'card#pay'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'pay', to: 'purchase#pay'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  
  resources :mypages
  resources :profiles, only:[:index]
  resources :informations, only:[:index]
  resources :items do
    resources :item_images, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
