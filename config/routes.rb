Rails.application.routes.draw do
  root 'links#new'
  get '/:identifier', to: 'links#show', as: :shortened_link
  resources :links, only: [:create, :destroy]
end
