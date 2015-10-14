Rails.application.routes.draw do

  root 'sessions#new'

  get '/auth/github', :as => 'auth_github'

  get '/auth/facebook', :as => 'auth_facebook'

  get '/auth/github/callback' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', :as => 'logout'

  resources :successes, only: [:index]


end
