Rails.application.routes.draw do

  get 'home/about'
   devise_for :users

   root 'top#index'

   get "home/about" => "home#about",as: 'about'

   resources :users, only: [:show, :edit, :index, :update] do
   	member do
   		get :following, :followers
   	end
   end
   resources :relationships, only: [:create, :destroy]

   resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
   	 resources :book_comments, only: [:create,:destroy]
     resource :favorites, only: [:create,:destroy]
   end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
