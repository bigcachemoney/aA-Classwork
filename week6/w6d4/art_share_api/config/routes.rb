Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :users

  get 'users/', to: 'users#index', as: 'index_user' #as renames the routes
  post 'users/', to: 'users#create', as: 'users'
  get 'users/new', to: 'users#new'
  get 'users/:id/edit', to: 'users#edit'
  get 'users/:id', to: 'users#show'
  patch 'users/:id', to: 'users#update' #patch makes partial changes
  put 'users/:id', to: 'users#update' #replaces with a completely new version
  delete 'users/:id', to: 'users#destroy'
  
end


  # resources :drops, only: [:index, :create, :show, :destroy, :update]
