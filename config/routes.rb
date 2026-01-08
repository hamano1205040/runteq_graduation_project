Rails.application.routes.draw do
  devise_for :users

  resources :training_records

  authenticated :user do
    root to: 'training_records#index', as: :authenticated_root
  end

  root 'home#index'
end
