# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  # mount ForestLiana::Engine => '/forest'

  mount Ckeditor::Engine => '/ckeditor'
  mount Commontator::Engine => '/commontator'

  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations', passwords: 'passwords', sessions: 'sessions', omniauth_callbacks: 'users/omniauth_callbacks' }

  # devise_for :users, :path_prefix => 'd'
  # resources :users, :only =>[:show]

  resources :transactions
  resources :carts
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :users
  resources :categories
  resources :notifications
  resources :contacts
  resources :invites
  resources :activities
  resources :photos
  # resources :invoicing, only: [:index, :update]
  resources :invoicing

  resources :requests do
    member do
      put 'like', to: 'requests#upvote'
      put 'dislike', to: 'requests#downvote'
    end
  end

  get 'pages/contact'
  get 'pages/invite'

  root to: 'pages#index'
  get 'index', to: 'pages#index'
  get 'contact', to: 'pages#contact'
  get 'invite', to: 'pages#invite'
  get 'about', to: 'pages#about'

  get 'error', to: 'pages#error'
  get 'terms', to: 'pages#terms'
  get 'cookie', to: 'pages#cookie'

  get 'faq', to: 'pages#faq'
  get 'privacy',   to: 'pages#privacy'

  get 'dashboard', to: 'pages#dashboard'
  get 'chartsgraphs', to: 'pages#chartsgraphs'

  # get 'invoicing',   to: 'invoicing#index'
  get 'invitations', to: 'pages#invitations'

  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get'

  match 'active'  => 'sessions#active',  via: :get
  match 'timeout' => 'sessions#timeout', via: :get

  get '*path', to: redirect('/error')

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
