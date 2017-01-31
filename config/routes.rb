Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, defaults: {format: :json}
  # constraints format: :json do
  #   resources :users, defaults: {format: :json}
  # end
  namespace :api, defaults: {format: :json} do
    resources :users, only: [:index, :create, :show, :update, :destroy]
    resources :posts, only: [:index, :create, :show, :update, :destroy]
  end
  root "static_pages#root"
end
