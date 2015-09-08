Rails.application.routes.draw do  
  get 'measurements/index'

  get 'measurements/new'

  get 'measurements/edit'

  get 'measurements/create'

  get 'measurements/update'

  get 'measurements/destroy'

  # devise_scope :user do
  #   get "sign_in", to: "sessions#new"
  #   get "admins/sign_in", to: "sessions#admin_new"
  #   get "tailors/sign_in", to: "sessions#tailor_new"
  #   get "sellers/sign_in", to: "sessions#seller_new"
  #   get "sessions/failour", to: "sessions#failour"
  # end

  # devise_for :users, :controllers => {:sessions => 'sessions'} 

  
  devise_for :users, :controllers => { :sessions => 'local_devise/sessions', 
                                       :registrations => 'local_devise/registrations', 
                                       :passwords => 'local_devise/passwords', 
                                       :confirmations => 'local_devise/confirmations', 
                                       :omniauth_callbacks => 'local_devise/omniauth_callbacks'}
  devise_scope :users do
    get '/users', :to => 'dashboard#index', :as => :user_root
  end  

  # match '/admin' => 'admin#index'
  # match '/dashboard' => 'dashboard#index'
  # match '/help' => 'help#index'

  # match '/admin/add_new_user' => 'admin#add_new_user', :as => :add_new_user
  # match '/admin/:id/update_user' => 'admin#update_user', :as => :update_user
  # match '/admin/:id/delete_user' => 'admin#delete_user', :as => :delete_user

  get '/facebox/fb_edit_user' => 'facebox#fb_edit_user', :as => :fb_edit_user
  get '/facebox/fb_create_user' => 'facebox#fb_create_user', :as => :fb_create_user
  get '/facebox/fb_login' => 'facebox#fb_login', :as => :fb_login  
  get '/facebox/fb_reset_password' => 'facebox#fb_reset_password', :as => :fb_reset_password

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  resources :filters
  resources :admins do
    collection do
      get :signup, :welcome
    end
    resources :discounts
    resources :brands
    resources :colors
  end
  
  resources :tailors do 
    collection do
      get :signup, :welcome
    end
  end
  resources :images
  # resources :products, only: [:index]
  resources :products do
    collection do
      get :details, :design
    end
  end
  resources :sellers do
    collection do
      get :signup, :welcome, :products, :ajax_products
    end
    resources :products, only: [:new, :show, :create, :update, :edit, :delete]
    # do
    #   collection do
    #     get :my_products
    #   end
    # end
  end

  resources :orders
  resources :order_items
  resources :pockets
  resources :back_pockets
  resources :fits
  resources :side_pockets
  resources :pant_cuffs
  resources :plates
  resources :pant_fastenings
  resources :sleeves
  resources :collars
  resources :plackets
  resources :bottoms
  resources :pleats
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
