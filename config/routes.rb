Rails.application.routes.draw do
  root 'links#new'
  resources :links, only: :create
end
