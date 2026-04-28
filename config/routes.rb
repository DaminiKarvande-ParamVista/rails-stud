Rails.application.routes.draw do
  devise_for :admin_users, controllers:{
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords'
  }
  resources :projects
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root 'welcome#index'

  resources :students do
    member do
      get :personal_details
    end
    # get :personal_details, on: :member #onl work when you sure that you meed only one member action

    collection do
      get :active
    end
  end

  # namespace :admin do
  #   resources :students
  # end

  # scope module: :admin do
  #   resources :students
  # end 

  namespace :admin do
    resources :students
    get 'dashboard' => 'dashboard#index'
  end
end
