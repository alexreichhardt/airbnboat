Rails.application.routes.draw do

  root to: 'pages#home'

   resources :boats do
      resources :bookings, only: [ :index, :new, :create, :show, :destroy ]
  end


  resources :bookings, only: [ :show, :index ] do
    resources :booking_reviews, only: [:show, :new, :create, :destroy]
  end


  # resources :booking_reviews, only: [ :index, :new, :create, :show, :destroy ]

  get 'users/edit_avatar' => 'users#edit_avatar', :as => :edit_avatar
  post 'users/edit_avatar' => 'users#new_avatar', :as => :new_avatar

  devise_for :users, controllers: {sessions: 'users/sessions'}
  resources :users, only: [:show]






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
