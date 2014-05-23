Tweeter::Application.routes.draw do

  devise_for :admins
  devise_for :users

  resources :events
  resources :societies

  #pages_controller
  post '/search' => 'pages#search', as: :search_input
  get '/applications' => 'admins#show_registrations', as: :show_registrations
  get '/account' => 'pages#account', as: :my_account


  #societies_controller
  post '/applications' => 'societies#confirm', as: :confirm
  get '/societies/:id/bearers' => 'societies#update_bearers', as: :update_bearers
  post '/societies/:id/bearers' => 'societies#create_bearers', as: :confirm_bearers
  get '/societies/:id/memberships' => 'societies#update_memberships', as: :update_memberships
  post '/societies/:id/memberships' => 'societies#confirm_memberships', as: :confirm_memberships

  get '/my_societies' => 'societies#my_societies', as: :my_societies

  #events_controller
  get '/my_events' => 'events#my_events', as: :my_events

  root 'pages#home'

end
