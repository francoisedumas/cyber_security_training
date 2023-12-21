Rails.application.routes.draw do
  root to: 'pages#home'
  resources :links, only: %i[index create]
  resources :users, only: %i[index create]
end
