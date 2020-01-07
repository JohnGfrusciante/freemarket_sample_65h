Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }  
  root to: "items#index"
  resources :items, only: [:index, :new, :edit, :update]
  resources :mypages, path: 'mypage'
  resources :items  do
    resources :item_images, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
