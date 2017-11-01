Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'recipes/short_time', to: 'recipes#short_time'

  resources :recipes, except: [:destroy] do
    resources :items, except: [:show] #no show
  end

  root 'recipes#index'
end
