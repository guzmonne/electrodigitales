Aos::Application.routes.draw do

  scope :api do
  	resources :users
  	resources :sessions
  	resources :clients
  end

  root to: 'users#index'
end
