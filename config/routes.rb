Rails.application.routes.draw do

  get 'users/show'

  resources :users, only: [:show]

  devise_for :users, controllers: {
  	       registrations: 'users/registrations'
          }




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
