Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  resources :fighters
 # get 'home/index'
 get 'home/about'

  root 'fighters#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
