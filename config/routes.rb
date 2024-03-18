Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "school", to: "pages#school"
  resources :aulas
  get "today", to: "aulas#today"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # TODO: figure out how to redirect after login
  # namespace @user do
  #   root to: today_path
  # end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
