Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, RegistrationsController: { registrations: 'registrations', intivations: 'users/invitations'}

  root to: "pages#home"

  get "about", to: "pages#about"
  get "school", to: "pages#school"
  get "today", to: "aulas#today"
  get "clientes", to: "user_aulas#clientes"
  get "profile", to: "aluno_profiles#profile"

  resources :aluno_profiles
  resources :aulas do
    resources :bookings, only: %i[create destroy]
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
