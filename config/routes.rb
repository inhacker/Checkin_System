Rails.application.routes.draw do
  get     'checkin'       => 'checkins#index'
  get     'login'         => 'sessions#new'
  post    'login'         => 'sessions#create'
  delete  'logout'        => 'sessions#destroy'
  get     'signup'        => "users#new"
	get     '/kids',       controller: 'kid',      action: 'index'
	post    '/kids',       controller: 'kid',      action: 'create'
	get     '/parents',    controller: 'parent',   action: 'index'
	post    '/parents',    controller: 'parent',   action: 'create'
	get     '/allergies',  controller: 'allergy',  action: 'index'
	post    '/allergies',  controller: 'allergy',  action: 'create'
  get     '/attendances',  controller: 'attendance',  action: 'index'
	post    '/attendances',  controller: 'attendance',  action: 'create'
  
  #get option to run
	put 		'kid/:id/change_primary_parent'				=> 'kid#change_primary_parent' 
	put 		'kid/:id/add_parent'									=> 'kid#add_parent' 
  get     '/parents/new/:kid_in_progress'				=> 'parent#new'
  get     '/allergies/new/:kid_in_progress' 		=> 'allergy#new'
	get     "/kid/:id/edit_parents"        				=> "kid#edit_parents", :as =>'edit_parents'
  get     '/parents/find_by_name/:query'				=> 'parent#find_by_name'
  get     '/parents/get_all_kids/:id'    				=> 'parent#get_all_kids'
  post    '/kids/checkin'               				=> 'kid#checkin'
  get 		"/other_queries/index", :controller 	=> 'other_queries', :action => 'index'

  

  #Examples 
  get 'temp/resource'
  get 'temp/index'
  get 'parent/index'
	get 'kid/index'

  #Root
  root 'checkins#index'

  #resources
	resources :attendance
  resources :allergy
	resources :kid
	resources :families
  resources :parent
  resources :users
  resources :temp 


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
