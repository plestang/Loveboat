Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boats do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:destroy, :edit, :update, :show]

  resources :users, only: [:destroy, :edit, :update, :show]
end
