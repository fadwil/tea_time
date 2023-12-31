Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :update]

      resources :customers, only: [] do
        resources :subscriptions, only: [:index], controller: 'subscriptions'
      end
    end
  end
end
