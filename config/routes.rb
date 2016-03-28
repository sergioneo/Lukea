Rails.application.routes.draw do
  resources :multimedia
  mount Ckeditor::Engine => '/ckeditor'
  resources :actuals
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks", registrations: 'registrations'}

  resources :movies
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  post 'movies/:id/create_comment', to: 'movies#create_comment', as: 'create_comment' 
  delete 'movies/:id/destroy_comment', to: 'movies#destroy_comment', as: 'destroy_comment'
  get 'nosotros', to: 'welcome#nosotros', as: 'nosotros'
  get 'contacto', to: 'welcome#contacto', as: 'contacto'
  
  match 'users/edit/agregar_saldo' => "pay_balance#agregar_saldo", :via => :post, as: 'agregar_saldo'
  match 'users/edit/quitar_saldo' => "pay_balance#quitar_saldo", :via => :post, as: 'quitar_saldo'
  match 'users/edit/obtener_pelicula' => "pay_balance#obtener_pelicula", :via => :post, as: 'obtener_pelicula'
  match 'khipu_callbacks' => "pay_balance#khipu_callbacks", :via => :post, as: 'khipu_callbacks'

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
