Rails.application.routes.draw do
  devise_for :users
  root to: "items#show"
  resources :items, only: [:index, :new, :edit, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
