Rails.application.routes.draw do
  root "sessions#new"
  get "/login", to: "sessions#new"
  get  "/signup",  to: "users#new"
  post "/signup",  to: "users#create"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  post "/run_project", to: "projects#run_project"
  get "run_project", to: "projects#run_project"
  resources :users do
    resources :projects
  end

  resources :projects do 
    resources :suggestions
  end
end
