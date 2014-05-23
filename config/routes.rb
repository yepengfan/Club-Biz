Tweeter::Application.routes.draw do

  devise_for :admins
  devise_for :users

  resources :events
  resources :societies

  #pages_controller
  post '/search' => 'pages#search', as: :search_input
  get '/applications' => 'admins#show_registrations', as: :show_registrations

  #societies_controller
  post '/applications' => 'societies#confirm', as: :confirm


  # get "/my_tweets" => "tweets#my_tweets", as: :my_tweets
  get '/account' => 'pages#account', as: :my_account

  root 'pages#home'

end
