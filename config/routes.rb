Rails.application.routes.draw do
  namespace :cached do
    resources :users do
      resources :recipes, controller: "user_recipes", only: [:index]
    end
  end
  namespace :memoized do
    resources :users do
      resources :recipes, controller: "user_recipes", only: [:index]
    end
  end
  root to: "home#show"
end
