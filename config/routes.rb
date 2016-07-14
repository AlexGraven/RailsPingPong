Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :games
  resources :players, except: :destroy
end
