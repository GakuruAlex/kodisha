Rails.application.routes.draw do
  namespace :kodisha do
    get "users", to: "users#index", as: "users"
    post "users", to: "users#create", as: "new_user"
    post "users/:id/make-landlord", to: "users#set_landlord_profile", as: "set_landlord_profile"
    patch "users/:id", to: "users#update", as: "update_user"
  end


  # Defines the root path route ("/")
  root "kodisha/users#index"

  # Landlord profile routes
  namespace :landlord do
    get "tenant-profiles", to: "tenant_profiles#index", as: "tenant_profiles"
    get "estates", to: "estates#index", as: "estates"
    post "new-tenant", to: "tenant_profiles#create", as: "new_tenant"
    post "new-estate", to: "estates#create", as: "new_estate"
  end

  resource :login
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
