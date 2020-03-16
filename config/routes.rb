Rails.application.routes.draw do
  resources :friendships
  get 'search/index'
  resources :posts, only: [:new, :create, :show, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
     resource :profile
  end
 root to: 'pages#home'
 get 'about', to: 'pages#about'
 resources :contacts, only: :create
 get 'contact-us', to: 'contacts#new'
 get 'search' => 'search#index'
 resources :posts do
 resources :likes
  end
 namespace :private do 
 resources :conversations, only: [:create] do
   member do
     post :close
   end
  end
  resources :messages, only: [:index, :create]
  end
    
end