Rails.application.routes.draw do

  get 'booking_reviews/new'
  get 'booking_reviews/create'
  get 'booking_reviews/show'
  get 'booking_reviews/destroy'
  get 'booking_reviews/index'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :boats do

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
