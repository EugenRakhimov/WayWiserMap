Rails.application.routes.draw do
  
  root 'visitors#index'

  get 'visitors/index'

  get 'locations/index'


end
