Rails.application.routes.draw do
  resources :article_specs
  root to:"articles#index"
  devise_for :user
  #get "/articles", to: "articles#index"
  resources :articles do
    resources :comments
  end
  namespace :api do
    namespace :v1 do
      resources :articles do
        resources :comments
      end
    end
  end
end