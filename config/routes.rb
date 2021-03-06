Rails.application.routes.draw do
  
  get 'tasks/new'

  get 'tasks/index'

  get 'tasks/show'

  get 'tasks/edit'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root  'static_pages#home'

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  get    'login'    => 'sessions#new'
  delete 'logout'   => 'sessions#destroy'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :fields,     only: [:index, :create, :show, :update]
  resources :seasons,          only: [:new, :create, :destroy]
  resources :cultivations,          only: [:new, :create]
  resources :mobs,     only: [:index, :create, :show, :update]
  resources :submobs,     only: [:new, :create]
  resources :warehouses,     only: [:index, :create, :show, :update]
  resources :buildings,     only: [:index, :create, :show, :update]
  resources :machines,     only: [:index, :create, :show, :update]
  resources :tasks,     only: [:index, :create, :show, :update]
  post 'tasks/select_object' => 'tasks#select_object'
  post 'tasks/selected_field' => 'tasks#selected_field'
  post 'tasks/selected_mob' => 'tasks#selected_mob'
  post 'tasks/selected_machine' => 'tasks#selected_machine'
  post 'tasks/selected_building' => 'tasks#selected_building'
  post 'tasks/selected_warehouse' => 'tasks#selected_warehouse'
  post 'tasks/selected_cultivation' => 'tasks#selected_cultivation'  
  post 'tasks/selected_submob' => 'tasks#selected_submob'  
  

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
