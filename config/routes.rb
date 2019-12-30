Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }  
  root to: "users#register_credit.html"
  resources :items, only: [:index, :new, :edit, :update] do
  end

  post '/pay' => "items#index"
end
