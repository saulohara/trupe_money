TrupeMoney::Application.routes.draw do
  root :to => 'home#index'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
  #get "/auth/:provider/calback" => "sessions#create", as: :auth_callback
  #get "/auth/failure" => "sessions#failure", as: :auth_failure
  #get "/logout" => "sessions#destroy", as: :logout
end
