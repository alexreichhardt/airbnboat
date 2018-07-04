Rails.application.routes.draw do

  root to: 'pages#home'

   resources :boats do
      resources :bookings, only: [ :index, :new, :create, :show, :destroy ]
  end


  resources :bookings, only: [ :show, :index ] do
    resources :booking_reviews, only: [:show, :new, :create, :destroy]
  end


  # resources :booking_reviews, only: [ :index, :new, :create, :show, :destroy ]

  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
