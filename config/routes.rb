Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, defaults: {format: :json}
  constraints format: :json do
    resources :users
  end
  root "static_pages#root"
end
