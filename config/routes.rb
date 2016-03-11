Rails.application.routes.draw do
  
  root 'visitors#index'

  get 'visitors/index'

  resources :locations, only: [:index]



end
