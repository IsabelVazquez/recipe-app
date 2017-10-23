Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :recipes

  resources :items do
    resources :ingredients
  end

  root 'recipes#index'
end
