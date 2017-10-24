Rails.application.routes.draw do
  resources :recipes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :items do
    resources :ingredients
  end

  root 'recipes#index'
end
