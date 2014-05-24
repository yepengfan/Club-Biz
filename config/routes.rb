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
  get 'societies/:id/show_bearers' => 'societies#show_bearers', as: :show_bearers
  get '/societies/:id/memberships' => 'societies#update_memberships', as: :update_memberships
  post '/societies/:id/memberships' => 'societies#confirm_memberships', as: :confirm_memberships
  get '/societies/:id/show_members' => 'societies#show_memberships', as: :show_members

  get '/my_societies' => 'societies#my_societies', as: :my_societies
  post '/societies/:id/edit' => 'societies#confirm_edit', as: :confirm_edit_society

  get '/societies/:id/update_events' => 'societies#update_events', as: :update_events
  post '/societies/:id/confirm_events' => 'societies#confirm_events', as: :confirm_events

  #events_controller
  get '/my_events' => 'events#my_events', as: :my_events
  post '/events/:id/comments' => 'events#add_comments', as: :add_comment
  post '/events/:id/reserve' => 'events#reserve_tickets', as: :reserve_tickets
  get '/events/:id/share_events' => 'events#share_events', as: :share_events
  post '/events/:id/share_events' => 'events#confirm_share', as: :confirm_share

  root 'pages#home'

end
