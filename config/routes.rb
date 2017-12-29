Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  # mount ForestLiana::Engine => '/forest'
  mount ForestLiana::Engine => '/forest'
  resources :transactions
  resources :carts
  resources :products
  # mount ForestLiana::Engine => '/forest'
  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations', passwords: 'passwords', sessions: 'sessions' }
  
  mount Commontator::Engine => '/commontator'
  
  resources :users
  resources :categories
  resources :notifications
  resources :contacts
  resources :activities
  resources :photos

  resources :requests do
    member do
      put "like", to: "requests#upvote"
      put "dislike", to: "requests#downvote"
    end
  end

  resources :products

  # post "products/add_to_cart" => "products#add_to_cart"


  get 'pages/contact'


  root to: 'pages#index'
  get 'index', to: 'pages#index'
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  get 'error', to: 'pages#error'
  get 'terms', to: 'pages#terms'
  get 'faq',   to: 'pages#faq'

  get 'dashboard', to: 'pages#dashboard'
  get 'chartsgraphs', to: 'pages#chartsgraphs'

  get 'invoicing', to: 'pages#invoicing'

  match 'active'  => 'sessions#active',  via: :get
  match 'timeout' => 'sessions#timeout', via: :get
  
  
  get "*path", to: redirect("/error") 
  
  #ActiveAdmin.routes(self)

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
