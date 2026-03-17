Rails.application.routes.draw do
  namespace :kodisha do
    resources :users
    post "users/:id/set_landlord", to: "users#set_landlord_profile", as: "set_landlord_profile"
    get "landlord_profiles/index"
    get "landlord_profiles/show"
    get "landlord_profiles/new"
  end


  # Defines the root path route ("/")
  root "kodisha/users#index"

  # Landlord profile routes
  namespace :landlord do
    post "users/:id/tenant", to: "tenant_profiles#create", as: "tenant_profile"

  end

  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
