Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  get 'signup/create'
  resources :records
  resources :artists
  # post "refresh", controller: :refresh, action: :create
  controller :refresh do
    post 'refresh' => 'refresh#create'
  end

  controller :signin do
    post 'signin' => 'signin#create'
    delete 'signout' => 'signin#destroy'
  end

  controller :signup do
    post 'signup' => 'signup#create'
  end
end
