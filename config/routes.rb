Rails.application.routes.draw do
  root to: 'pages#home'
  get '/htmlsafe', to: 'htmlsafe#index'
  resources :links, only: %i[index create]
  resources :users, only: %i[index create]
  resources :products, only: %i[index]
end
