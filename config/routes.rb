Rails.application.routes.draw do
  devise_for :users, controllers: {
    users: 'sessions'
  }
  devise_scope :user do 
	  get '/auth', to: 'devise/sessions#new', as: :auth
	  get '/login', to: 'devise/sessions#new', as: :login
	  get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'
   get '/', to: 'welcome#:index', as: :home
   get '/profile', to: 'profile#new', as: :profile
   get '/:action', to: 'welcome#:action'
   
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
   namespace :admin do
     resources :chapters
     resources :convention_events
     resources :countries
     resources :members
     resources :payment_purposes
     resources :payments
     resources :photos
     resources :projects
     resources :states
     resources :users
     resources :zips
   end
end
