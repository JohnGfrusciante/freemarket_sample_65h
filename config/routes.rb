Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }  
  root to: "card#new"
  resources :items, only: [:index, :new, :edit, :update] do
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
