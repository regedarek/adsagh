Adsagh::Application.routes.draw do
  get "zaloguj" => "sessions#new", :as => "zaloguj"
  get "wyloguj" => "sessions#destroy", :as => "wyloguj"
  match "/signout" => "ads#signout_advertiser", :as => :signout
  resources :sessions
  resources :searches
  resources :categories
  resources :verifications do
    member do
      get 'fast_verify'
      put 'fast_verify'
      get 'verify'
      put 'verify'
      put 'discard'
      get 'discard'
      put 'discard_info'
      get 'verify_info'
      put 'verify_info'
      get 'fast_verify_info'
      put 'fast_verify_info'
    end
  end
  match "/verifications/:scope" => "verifications#index"

  resources :ads do
    member do
      get 'confirm'
      put 'finish'
    end
  end

  match ':controller/:action/:id/:token'
  match "/auth/:provider/callback" => "ads#auth"
  match ':id' => "ads#show", :as=>:short_ad

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'ads#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
