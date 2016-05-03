Rails.application.routes.draw do
  root             "static_pages#home"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :courses, only: [:index, :show]
  resources :user_courses
  resources :users, only: :show
  namespace :admin do
    root "courses#index"
    resources :courses do
      resource :supervisor_courses
    end
    resources :subjects
    resources :users
  end
end
