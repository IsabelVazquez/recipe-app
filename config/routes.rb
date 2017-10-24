Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :recipes do
    resources :items
  end
  
  resources :ingredients

  root 'recipes#index'
end
