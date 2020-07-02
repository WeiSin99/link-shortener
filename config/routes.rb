Rails.application.routes.draw do
  root 'links#new'
  get '/:shortened_link', to: 'links#show'
  resources :links, only: :create
end
