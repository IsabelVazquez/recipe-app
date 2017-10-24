Rails.application.routes.draw do
  resources :items
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :recipes do
    resources :ingredients
  end

  root 'recipes#index'
end
