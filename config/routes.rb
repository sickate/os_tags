Rails.application.routes.draw do
  devise_for :users

  resources :countries

  resources :cities

  resources :offices

  resources :projects

  resources :groups

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # get 'home/index'
  get 'tags', to: 'home#tags'
  root 'groups#index'

  get 'tags/:tag', to: 'users#index', as: :tag

end
