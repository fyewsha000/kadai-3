Rails.application.routes.draw do

  get 'home/about'
   devise_for :users

   root 'top#index'

   get "home/about" => "home#about",as: 'about'

   resources :users, only: [:show, :edit, :index, :update]
        resources :books, only: [:create, :index, :show, :edit, :destroy, :update]






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
