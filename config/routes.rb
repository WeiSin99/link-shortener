Rails.application.routes.draw do
  root 'links#new'
  get '/:link_identifier', to: 'links#show', as: :shortened_link
  resources :links, only: [:create, :destroy]
end
