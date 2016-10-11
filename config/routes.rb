Rails.application.routes.draw do
  root to: "static_pages#home"

  get 'static_pages/contact'
  devise_for :users
  resources :posts, only: [:index, :new, :create, :destroy]
end
