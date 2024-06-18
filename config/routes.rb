Rails.application.routes.draw do
  namespace :commands do
    resources :orders, only: [:create]
  end

  namespace :queries do
    resources :orders, only: [:index]
  end
end
