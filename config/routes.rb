Rails.application.routes.draw do
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
    
end