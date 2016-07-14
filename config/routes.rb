Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :games

  #TODO when we get to roles and logins, we need
  #an admin namespace where we deactivate players, as opposed
  #to destroying them.
  
  resources :players, except: :destroy
end
