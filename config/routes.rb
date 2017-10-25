Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :recipes do
    resources :items, only: [:new, :create, :edit, :update, :destroy] #no index and show
  end

  root 'recipes#index'
end
