Rails.application.routes.draw do
<<<<<<< HEAD

=======
>>>>>>> 34aada99d64179836ccff2f1de384ca0c958ad23
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }  
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :edit, :update]　do
    resources :item_image, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
