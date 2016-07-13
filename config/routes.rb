Rails.application.routes.draw do
  resources :games, except: [:destroy]
  resources :players, except: [:destroy]
end
