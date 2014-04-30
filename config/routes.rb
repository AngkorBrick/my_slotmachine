Myapp::Application.routes.draw do

  devise_for :admins

  get "about_team/index",to: "about_team#index",as: :about_team_index
  get "implement/index",to: "implement#index",as: :implement_index
  get "programming/index",to: "programming#index",as: :programming_index
  get "construction2/index",to: "construction2#index",as: :construction2_index
  get "construction1/index",to: "construction1#index",as: :construction1_index
  get "top_page/index",to: "top_page#index",as: :top_page_index
  get "comment/index",to: "comment#index",as: :comment_index
  post "comment/create",to: "comment#create",as: :comment_create
  get "reply/index",to: "replies#index",as: :reply_index
  
  devise_scope :admin do
    match "kh-verwalter", to: "devise/sessions#new", as: :custom_admin_signin
    authenticated :admin do
      root :to => 'comment#index'
      delete "comment/delete",to: "comment#destroy",as: :destroy_comment
      delete "reply/delete",to: "replies#destroy",as: :destroy_reply  
    end
  end
  
  #resources :comment
  resources :replies

  get "download/presentation",to: "application#download_presentation",as: :down_presentation
  get "download/code",to: "application#download_code",as: :down_code
  get "download/poster",to: "application#download_poster",as: :down_poster
  
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
  # root :to => 'welcome#index'
  root :to => 'top_page#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
